//
//  DJPictureViewerModel.m
//  DJPictureViewer
//
//  Created by djl on 2016.
//  Copyright © 2016年 djl. djliu( https://github.com/djliu328 )
//

#import "DJPictureViewerModel.h"

@implementation DJPictureViewerModel

@synthesize dj_image;

//加载内容
- (id)initWithimage:(NSString*)imageName {
    self = [super init];
    if(self != nil) {
        dj_image = [UIImage imageNamed:imageName];
    }
    return self;
}

@end
