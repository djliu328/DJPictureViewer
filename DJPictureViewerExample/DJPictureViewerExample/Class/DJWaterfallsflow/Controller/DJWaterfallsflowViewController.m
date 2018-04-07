//
//  DJWaterfallsflowViewController.m
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "DJWaterfallsflowViewController.h"
#import "DJPictureViewer.h"
#import "DJLayoutCell.h"
#import "DJLayoutModel.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIButton+DJButton.h"

@interface DJWaterfallsflowViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,DJWaterfallsflowLayoutDelegate>

/** 所有的数据 */
@property (nonatomic, strong) NSMutableArray *dataArr;
/** collectionView */
@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation DJWaterfallsflowViewController

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

static NSString * const DJDataId = @"data";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置瀑布流布局
    [self setupWaterfallsflowLayout];
    // 刷新数据
    [self setupRefresh];
    // 返回事件
    [self setupBackEvent];
}

/** 刷新数据 */
- (void)setupRefresh
{
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.collectionView.header beginRefreshing];
    
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.collectionView.footer.hidden = YES;
}
/** 下拉刷新 */
- (void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *datas = [DJLayoutModel objectArrayWithFilename:@"layout.plist"];
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:datas];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.header endRefreshing];
    });
}
/** 上拉加载更多数据 */
- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *datas = [DJLayoutModel objectArrayWithFilename:@"layout.plist"];
        [self.dataArr addObjectsFromArray:datas];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.footer endRefreshing];
    });
}

/** 布局 */
- (void)setupWaterfallsflowLayout
{
    // 创建布局
    DJWaterfallsflowLayout *layout = [[DJWaterfallsflowLayout alloc] init];
    layout.delegate = self;
    
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_BAR_HEIGHT - IPHONE_X_BOTTOM_HEIGHT) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    if (@available(iOS 11.0, *)){
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);//导航栏如果使用系统原生半透明的，top设置为64
        collectionView.scrollIndicatorInsets = collectionView.contentInset;
    }
    
    // 注册cell
    [collectionView registerClass:[DJLayoutCell class] forCellWithReuseIdentifier:DJDataId];
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.footer.hidden = self.dataArr.count == 0;
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DJLayoutCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DJDataId forIndexPath:indexPath];
    cell.layoutModel = self.dataArr[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellitem 点击事件");
}

#pragma mark - <DJWaterfallsflowLayoutDelegate>
- (CGFloat)waterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    DJLayoutModel *layoutModel = self.dataArr[index];
    return itemWidth * layoutModel.height / layoutModel.width;
}

///** 返回瀑布流列数 */ //（可选自定义）
//- (CGFloat)columnCountInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
//{
//    return 3;
//}
//
///** 返回竖直间距 */
//- (CGFloat)columnMarginInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
//{
//    return 10;
//}
//
///** 返回水平间距 */
//- (CGFloat)rowMarginInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
//{
//    return 10;
//}
//
///** 返回边缘间距 */
//- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
//{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

/** 返回事件 */
- (void)setupBackEvent
{
    UIView *superView = self.view;
    [UIButton buttonWithSuperView:superView target:self action:@selector(backEvent:)];
}

- (void)backEvent:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
