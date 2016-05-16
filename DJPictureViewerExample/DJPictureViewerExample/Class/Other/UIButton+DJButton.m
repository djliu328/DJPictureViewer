//
//  UIButton+DJButton.m
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "UIButton+DJButton.h"
#import "Masonry.h"

@implementation UIButton (DJButton)

+ (UIButton *)buttonWithSuperView:(UIView *)superView target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).offset(10);
        make.top.equalTo(superView.mas_top).offset(20);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 15;
    button.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
