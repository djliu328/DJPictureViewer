//
//  UIButton+DJButton.h
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import <UIKit/UIKit.h>

@interface UIButton (DJButton)

+ (UIButton *)buttonWithSuperView:(UIView *)superView target:(id)target action:(SEL)action;

@end
