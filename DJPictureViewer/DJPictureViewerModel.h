//
//  DJPictureViewerModel.h
//  DJPictureViewer
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import <UIKit/UIKit.h>

@interface DJPictureViewerModel : NSObject

/** 图片名称 */
@property (nonatomic, strong) UIImage *dj_image;

//加载
- (id)initWithimage:(NSString*)imageName;

@end
