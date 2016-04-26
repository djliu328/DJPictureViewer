//
//  DJPictureViewer.m
//  DJPictureViewer
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "DJPictureViewer.h"

@implementation DJPictureViewer

/**
 *  是否开启定时器
 */
- (void)setStartTimer:(BOOL)startTimer
{
    _startTimer = startTimer;
    [self beginTimer];
    
}
/**
 *  开启定时器
 */
- (void)beginTimer
{
    if (_startTimer) {
        timer =  [NSTimer scheduledTimerWithTimeInterval:3.0
                                                  target:self
                                                selector:@selector(timerAction)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

//初始化
- (id)initWithFrame:(CGRect)frame imgArr:(NSMutableArray*)imgArr
{
    self = [super initWithFrame:frame];
    if(self != nil) {
        self.backgroundColor = [UIColor blackColor];
        
        //初始化背景图片
        [self initWithBackGroungImg:frame];
        
        //初始化ScrollView
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.delegate = self;
        self.scrollView = scrollView;
        [self addSubview:scrollView];
        
        //初始化PageView
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = imgArr.count;
        [pageControl sizeToFit];
        [pageControl setCenter:CGPointMake(frame.size.width / 2.0, frame.size.height - 50)];
        self.pageControl = pageControl;
        [self addSubview:pageControl];
        self.scrollView.contentSize = CGSizeMake(imgArr.count * frame.size.width, frame.size.height);
        
        //图片数组
        _imgArr = imgArr;

        _currentPage = -1;
        
        /** 展示图片 */
        [self showImage];
    }
    
    return self;
}

/**
 *  初始化背景图片
 */
- (void)initWithBackGroungImg:(CGRect)frame
{
    //当前视图背景
    UIImageView *sourceBGImg = [[UIImageView alloc] initWithFrame:frame];
    [sourceBGImg setContentMode:UIViewContentModeScaleAspectFill];
    [sourceBGImg setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.sourceBGImg = sourceBGImg;
    [self addSubview:sourceBGImg];
    
    //过渡视图背景
    UIImageView *processBGImg = [[UIImageView alloc] initWithFrame:frame];
    [processBGImg setContentMode:UIViewContentModeScaleAspectFill];
    [processBGImg setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.processBGImg = processBGImg;
    [self addSubview:processBGImg];
    
    //背影
    UIImageView *shadowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DJPictureViewer.bundle/backShadow_dj"]];
    shadowImageView.contentMode = UIViewContentModeScaleToFill;
    shadowImageView.frame = CGRectMake(0, frame.size.height-300, frame.size.width, 300);
    [self addSubview:shadowImageView];

}

/**
 *  展示图片
 */
- (void)showImage
{
    long pageNum = MAX(0, MIN(_imgArr.count - 1, (int)(self.scrollView.contentOffset.x / self.frame.size.width)));
    
    if(pageNum != _currentPage) {
        _currentPage = pageNum;
        
        self.sourceBGImg.image = [(DJPictureViewerModel *)[_imgArr objectAtIndex:_currentPage] dj_image];
        self.processBGImg.image = _currentPage + 1 != [_imgArr count] ? [(DJPictureViewerModel *)[_imgArr objectAtIndex:_currentPage + 1] dj_image] : nil;
    }
    
    float offset =  self.scrollView.contentOffset.x - (_currentPage * self.frame.size.width);
    
    if(offset < 0) {
        self.pageControl.currentPage = 0;
        
        offset = self.frame.size.width - MIN(-offset, self.frame.size.width);
        self.processBGImg.alpha = 0;
        self.sourceBGImg.alpha = (offset / self.frame.size.width);
        
    } else if(offset != 0) {
        if(pageNum == _imgArr.count - 1) {
            self.pageControl.currentPage = _imgArr.count - 1;
            self.sourceBGImg.alpha = 1.0 - (offset / self.frame.size.width);
        } else {
            self.pageControl.currentPage = (offset > self.frame.size.width / 2) ? _currentPage + 1 : _currentPage;
            self.processBGImg.alpha = offset / self.frame.size.width;
            self.sourceBGImg.alpha = 1.0 - _processBGImg.alpha;
        }
    } else {
        self.pageControl.currentPage = _currentPage;
        self.sourceBGImg.alpha = 1;
        self.processBGImg.alpha = 0;
    }
}

/**
 *  定时器事件
 */
- (void)timerAction
{
    [self.scrollView setContentOffset:CGPointMake((_currentPage + 1 == _imgArr.count ? 0 : _currentPage + 1) * self.frame.size.width, 0) animated:YES];
}

#pragma mark -- UIScrollViewDelegate(代理事件)
- (void)scrollViewDidScroll:(UIScrollView *)scroll {
    [self showImage];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scroll {
    if(timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    [self beginTimer];
}

@end
