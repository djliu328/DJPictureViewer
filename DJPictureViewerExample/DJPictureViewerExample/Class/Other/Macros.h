//
//  Macros.h
//  DJPictureViewerExample
//
//  Created by djl on 2018/4/7.
//  Copyright © 2018年 djl. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define IS_IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define IS_IOS_9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? YES : NO)
#define IS_IOS_10 (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_0)

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];

// MARK:- 系统尺寸宏定义
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_SCALE [[UIScreen mainScreen] scale]
// MARK:- 手机型号
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_6_OR_6P (IS_IPHONE_6 || IS_IPHONE_6P)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812)

#define STATUS_BAR_HEIGHT (IS_IPHONE_X?44:20)
#define NAV_BAR_HEIGHT 44
#define TOP_BAR_HEIGHT (STATUS_BAR_HEIGHT+NAV_BAR_HEIGHT)
#define EMPTY_CELL_HEIGHT [SFitUtil fit:240]

#define TAB_BAR_HEIGHT (IS_IPHONE_X?78:44)
#define IPHONE_X_BOTTOM_HEIGHT (IS_IPHONE_X?34:0)
#define BOTTOM_BAR_HEIGHT (IS_IPHONE_X?78:44)
#define HEAD_BAR_HEIGHT (IS_IPHONE_X?88:64)

#endif /* Macros_h */
