//
//  DJLayoutModel.h
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import <UIKit/UIKit.h>

@interface DJLayoutModel : NSObject

/** 图片高度 */
@property(nonatomic,assign) CGFloat height;
/** 图片链接 */
@property(nonatomic,copy) NSString *imgurl;
/** 图片价格 */
@property(nonatomic,copy) NSString *price;
/** 图片宽度 */
@property(nonatomic,assign) CGFloat width;

@end
