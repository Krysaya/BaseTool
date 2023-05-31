//
//  StringMacros.h
//  taojiamao
//
//  Created by yueyu on 2018/4/26.
//  Copyright © 2018年 yueyu. All rights reserved.
//


#ifndef StringMacros_h
#define StringMacros_h

//#import "FuctionTools.h"

//RGB
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
//RGBA
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//16进制颜色
#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ssRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

//主色4A8AFF
#define KALLRGB    ssRGBHex(0x3896FF)

//背景
#define KBGRGB     [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]
#define KFONTRGB     [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]

#define KBlueRGB   [UIColor colorWithRed:54/255.0 green:116/255.0 blue:255/255.0 alpha:1.0]
#define KRedRGB    [UIColor colorWithRed:206/255.0 green:50/255.0 blue:52/255.0 alpha:1.0]
#define KGreenRGB  [UIColor colorWithRed:60/255.0 green:188/255.0 blue:163/255.0 alpha:1.0]
#define KGrayRGB   [UIColor colorWithRed:161/255.0 green:161/255.0 blue:161/255.0 alpha:1.0]
#define KYellowRGB [UIColor colorWithRed:239/255.0 green:217/255.0 blue:115/255.0 alpha:1.0]
#define KOrangeRGB [UIColor colorWithRed:251/255.0 green:133/255.0 blue:53/255.0 alpha:1.0]

//随机颜色
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//快速转string
#define NUM_STRING(a,b)   [NSString stringWithFormat:a,b];

//字号
#define KFontSize(a)  [UIFont systemFontOfSize:a];

//布局
#define S_F   [UIScreen mainScreen].bounds
#define S_S   [UIScreen mainScreen].bounds.size
#define SreenW   [UIScreen mainScreen].bounds.size.width
#define SreenH   [UIScreen mainScreen].bounds.size.height

// 刘海屏 宏定义
///MARK:  iPhone X 刘海屏系列宏定义判断（适用目前所有的iPhone刘海屏）

#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})\

//#define iPhoneX ((SreenH >= 812.f) ? YES : NO)
// 适配刘海屏状态栏高度
#define SafeAreaStatusBarHeight (iPhoneX ? 44.f : 20.f)
// 适配iPhone X 导航栏高度
#define SafeAreaTopHeight       (iPhoneX ? 88.f : 64.f)


// 适配iPhone X Tabbar距离底部的距离
#define SafeAreaBottomMargin    (iPhoneX ? 34.f : 0.f)

#define S_H  SreenH - SafeAreaBottomMargin

//#define BottmHeight
//检测程序是在真机上还是在模拟器上
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

//weakSelf
#define WeakSelf __weak typeof(self) weakSelf = self;


#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;
#define WEAK  @weakify(self);
#define STRONG  @strongify(self);


//当前版本

#define Version  [(__bridge NSDictionary *)CFBundleGetInfoDictionary(CFBundleGetMainBundle())objectForKey:@"CFBundleShortVersionString"]

//用户中心数据
#define GetUserDefaults(a) [[NSUserDefaults standardUserDefaults] objectForKey:a]

#define SetUserDefaults(a,b) {\
NSUserDefaults * defa = [NSUserDefaults standardUserDefaults];\
[defa setObject:a forKey:b];\
[defa synchronize];\
};\

#define RemoveUserDefaults(a){\
NSUserDefaults * defa = [NSUserDefaults standardUserDefaults];\
[defa removeObjectForKey:a];\
[defa synchronize];\
};\

//本地存储地址
#define APP_DOCUMENT                [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define DocumentPath(path)          [APP_DOCUMENT stringByAppendingPathComponent:path]

#define MAX_V(X,Y) ((X) > (Y) ? (X) : (Y))// 求两个数中的最大值

//常用对象
#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

//打开设置
#define OpenSystemSetting {\
NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];\
if([[UIApplication sharedApplication] canOpenURL:url]) {\
[[UIApplication sharedApplication] openURL:url];\
}\
}

// 懒加载
#define HT_LAZY(object, assignment) (object = object ?: assignment)

#endif /* StringMacros_h */
















