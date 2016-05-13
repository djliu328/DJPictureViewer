//
//  ViewController.m
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "ViewController.h"
#import "DJPictureViewer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //你的图片数据源
    NSArray *imageArr = @[@"example1",@"example2",@"example3",@"example4",@"example5"];
    
    //图片查看
    DJPictureViewer *pictureViewer = [[DJPictureViewer alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) imgArr:imageArr];
    
    //选择控制定时器开关
//    pictureViewer.startTimer = YES;
    [self.view addSubview:pictureViewer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
