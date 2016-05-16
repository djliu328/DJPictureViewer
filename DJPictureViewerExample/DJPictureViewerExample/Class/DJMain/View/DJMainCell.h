//
//  DJMainCell.h
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import <UIKit/UIKit.h>

@interface DJMainCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setupDataWithIndexPath:(NSIndexPath *)indexPath;

@end
