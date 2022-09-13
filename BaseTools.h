//
//  BaseTools.h
//  ywt
//
//  Created by q on 2018/11/21.
//  Copyright © 2018年 kris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseTools : NSObject
+(instancetype)sharedBaseTools;
#pragma mark - 时间字符串格式化
+(NSString *)timeString:(NSString *)dateStr withDateFormatter:(NSString *)formatter;

//TODO:获取时间s字符串
+(NSString*)getCurrentTimesWithNowDate:(NSDate *)nowDate;
//TODO:获取时间戳有两种方法(以秒为单位)
+(NSString *)getNowTimeTimestampWithNowDate:(NSDate *)nowDate;

//TODO:时间字符转date
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr;
+(NSString *)dateConversionTimeStamp:(NSDate *)nowDate;

+ (NSString *)sha1:(NSString *)inputString;
//日期加减1
+ (NSString *)dateWithAddOrSubstract:(NSString *)type withNowDate:(NSString *)time;

/*秒转00:00:00*/
+(NSString *)getMMSSFromSS:(NSString *)totalTime;
//TODO:时间字符串相差多少秒
+ (NSTimeInterval)timerInterval:(NSString *)startime withendTime:(NSString *)endtime;
//TODO:--------------/*计算任意两个时间差*/
+ (NSString *)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;
//TODO:检查字符非空 nil null @“” <null>
+(BOOL)judgeBlankString:(NSString *)aStr;
//TODO:--------------打电话
+ (void)telWithPhone:(NSString *)tel;


//清除path文件夹下缓存
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

//将文件大小转换为 M/KB/B
+ (NSString *)fileSizeConversion:(NSInteger)totalSize;
//TODO:缓存
+ (NSInteger)getCacheSizeWithFilePath:(NSString *)path;;
//判断⼿机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile;
/****工程内全局方法*****************************************************************************/
+ (NSString *)UTF8String:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
