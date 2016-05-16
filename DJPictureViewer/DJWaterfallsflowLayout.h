//
//  DJWaterfallsflowLayout.h
//  DJPictureViewerExample
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import <UIKit/UIKit.h>

@class DJWaterfallsflowLayout;

@protocol DJWaterfallsflowLayoutDelegate <NSObject>

@required
/** 每个item高度 (方法必须实现) */
- (CGFloat)waterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/** 瀑布流列数 */
- (CGFloat)columnCountInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout;
/** 竖直间距 */
- (CGFloat)columnMarginInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout;
/** 水平间距 */
- (CGFloat)rowMarginInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout;
/** 边缘间距 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout;
@end

@interface DJWaterfallsflowLayout : UICollectionViewLayout

/** 代理 */
@property (nonatomic, weak) id<DJWaterfallsflowLayoutDelegate> delegate;

@end
