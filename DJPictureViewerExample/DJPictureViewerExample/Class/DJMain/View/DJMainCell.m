//
//  DJMainCell.m
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "DJMainCell.h"
#import "Masonry.h"

@interface DJMainCell ()

/** 显示内容 */
@property(nonatomic,weak) UILabel *contentLabel;

@end

@implementation DJMainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIView *superView = self;
    int padding = 0;
    //2.要显示的内容
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).with.offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.bottom.equalTo(superView.mas_bottom).offset(padding);
        make.right.equalTo(superView.mas_right).offset(padding);
    }];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"DJPictureViewer";
    DJMainCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[DJMainCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setupDataWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        self.contentLabel.text = @"瀑布流";
    }else if (indexPath.row == 1)
    {
        self.contentLabel.text = @"图片查看";
    }
}

@end
