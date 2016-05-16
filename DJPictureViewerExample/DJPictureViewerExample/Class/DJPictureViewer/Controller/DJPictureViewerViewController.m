//
//  DJPictureViewerViewController.m
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "DJPictureViewerViewController.h"
#import "DJPictureViewer.h"
#import "UIButton+DJButton.h"

@interface DJPictureViewerViewController ()

@end

@implementation DJPictureViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupPhotoViewer];
    [self setupBackEvent];
}

#pragma mark --- <PhotoViewer>
- (void)setupPhotoViewer
{
    //你的图片数据源
    NSArray *imageArr = @[@"example1",@"example2",@"example3",@"example4",@"example5"];
    
    //图片查看
    DJPicture *pictureView = [[DJPicture alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) imgArr:imageArr];
    
    //选择控制定时器开关
    //    pictureViewer.startTimer = YES;
    [self.view addSubview:pictureView];
}

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
