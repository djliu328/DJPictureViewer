//
//  DJLayoutCell.m
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "DJLayoutCell.h"
#import "DJLayoutModel.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@interface DJLayoutCell ()

/** 瀑布流要显示图片内容 */
@property(nonatomic,weak) UIImageView *imageView;
/** 价格显示 */
@property(nonatomic,weak) UILabel *priceLabel;

@end

@implementation DJLayoutCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIView *superView = self;
    int padding = 0;
    
    //1.要显示的图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    self.imageView = imageView;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).with.offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.bottom.equalTo(superView.mas_bottom).offset(padding);
        make.right.equalTo(superView.mas_right).offset(padding);

    }];
    //2.要显示的价格
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    [self addSubview:priceLabel];
    self.priceLabel = priceLabel;
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView.mas_left).offset(padding);
        make.bottom.equalTo(superView.mas_bottom).offset(padding);
        make.right.equalTo(superView.mas_right).offset(padding);
        make.height.mas_equalTo(20);
    }];
}

- (void)setLayoutModel:(DJLayoutModel *)layoutModel
{
    //1.设置图片内容
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:layoutModel.imgurl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    //1.1临时调整请图片内容为本地图片
    self.imageView.image = [UIImage imageNamed:layoutModel.imgurl];
    //2.设置价格内容
    self.priceLabel.text = layoutModel.price;
}

@end
