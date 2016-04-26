//
//  DJPictureViewer.h
//  DJPictureViewer
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import <UIKit/UIKit.h>
#import "DJPictureViewerModel.h"

@interface DJPictureViewer : UIView <UIScrollViewDelegate>{
    /** 定时器 */
    NSTimer *timer;
}

/** 当前图片页码 */
@property (nonatomic , assign) long            currentPage;

/** 显示当前视图背景 */
@property (nonatomic , weak) UIImageView       *sourceBGImg;

/** 中间过渡视图背景 */
@property (nonatomic , weak) UIImageView       *processBGImg;

/** 图片数组 */
@property (nonatomic , strong) NSMutableArray  *imgArr;

/** 显示图片ScrollView */
@property (nonatomic , weak) UIScrollView      *scrollView;

/** 分页控制器 */
@property (nonatomic , weak) UIPageControl     *pageControl;

/** 是否开启定时器(默认是关闭) */
@property (nonatomic, assign) BOOL             startTimer;


- (id)initWithFrame:(CGRect)frame imgArr:(NSMutableArray *)imgArr;


@end
