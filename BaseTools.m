
//
//  BaseTools.m
//  ywt
//
//  Created by q on 2018/11/21.
//  Copyright © 2018年 kris. All rights reserved.
//

#import "BaseTools.h"
#import <CommonCrypto/CommonDigest.h>
@interface BaseTools()


@end
@implementation BaseTools
+(instancetype)sharedBaseTools{
    
    static BaseTools * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BaseTools alloc]init];
    });
    return instance;
    
}
#pragma mark - 时间字符串格式化
+(NSString *)timeString:(NSString *)dateStr withDateFormatter:(NSString *)formatter{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:formatter];
    NSDate *datestr = [format dateFromString:dateStr];
    NSString *gsh = [format stringFromDate:datestr ];
    return gsh;
}
//TODO:获取当前的时间s字符串
+(NSString*)getCurrentTimesWithNowDate:(NSDate *)nowDate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:nowDate];
    return currentTimeString;
}
//TODO:获取当前时间戳有两种方法(以sss秒为单位)
+(NSString *)getNowTimeTimestampWithNowDate:(NSDate *)nowDate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:sss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/BeiJing"];
    [formatter setTimeZone:timeZone];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[nowDate timeIntervalSince1970]*1000];
    return timeSp;
}

//TODO:检查字符非空 nil null @“” <null>
+(BOOL)judgeBlankString:(NSString *)aStr {
    
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!aStr.length) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}
//TODO: 根据正则表达式校验字符串
+ (BOOL)validateStr:(NSString *)string withRegex:(NSString *)regex
{
    NSPredicate *resultStr = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [resultStr evaluateWithObject:string];
}


//TODO:时间戳转换2022-06-10
+(NSString *)timeStampConversionNSString:(NSString *)timeStamp withFormatterType:(NSString *)formatterType
{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp integerValue]/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatterType];

//    NSDate *date = [formatter dateFromString:timeStamp];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
+(NSString *)dateConversionTimeStamp:(NSDate *)nowDate{

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[nowDate timeIntervalSince1970]*1000];
    return timeSp;
    
}
//TODO:时间字符转date
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datestr = [dateFormatter dateFromString:dateStr];
    return datestr;
}
/*过滤所有空格*/
+ (NSString *)stringContainCharactersInSet:(NSString *)str{
    NSString *topstr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *endStr = [topstr stringByReplacingOccurrencesOfString:@" " withString:@""];
    return endStr;
}

//TODO:时间字符串相差多少秒
+ (NSTimeInterval)timerInterval:(NSString *)startime withendTime:(NSString *)endtime{
//    NSDate *nowDate = [NSDate date]; // 当前日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *start = [formatter dateFromString:startime];// 将传入的字符串转化成时间
    NSDate *creat = [formatter dateFromString:endtime];// 将传入的字符串转化成时间
    NSTimeInterval delta = [start timeIntervalSinceDate:creat]; // 计算出相差多少秒
    return delta;
}


/*秒转00:00:00*/
+(NSString *)getMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time;
   
    format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];

    
    
    return format_time;
    
}
//TODO:--------------/*计算任意两个时间差*/
+ (NSString *)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//根据自己的需求定义格式
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    NSString *dural = @"";
    int day = (int)(time/3600/24);
    int hour = (int)(time - day*3600*24)/3600;

    int minute = (int)(time - hour*3600)/60;
//    int second = aTimer - hour*3600 - minute*60;
    
    if (day==0) {
        if (minute==0) {
            dural = [NSString stringWithFormat:@"%d小时", hour];
        }else{
            dural = [NSString stringWithFormat:@"%d小时%d分钟", hour, minute];

        }

    }else{
        if (hour==0) {
            if (minute==0) {
              dural = [NSString stringWithFormat:@"%d天", day];
            }else{
                dural = [NSString stringWithFormat:@"%d天%d分",day,minute];
            }
            
        }else{
            dural = [NSString stringWithFormat:@"%d天%d小时", day, hour];

        }
    }
    
    return dural;
}

+ (NSString *)md5:(NSString *)input{
    const char *cStr = [input UTF8String];
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
+ (NSString *)sha1:(NSString *)inputString{
    const char *cstr = [inputString cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:inputString.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes,(unsigned int)data.length,digest);
    NSMutableString *outputString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [outputString appendFormat:@"%02x",digest[i]];
    }
    return outputString;
}
+ (NSString *)pleaseInsertStarTimeo:(NSString *)time1 andInsertEndTime:(NSString *)time2 withType:(NSString *)dtype{
// 1.将时间转换为date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *date1 = [formatter dateFromString:time1];
    NSDate *date2 = [formatter dateFromString:time2];
    // 2.创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 3.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:date1 toDate:date2 options:0];
    // 4.输出结果
    NSLog(@"两个时间相差%ld年%ld月%ld日%ld小时%ld分钟%ld秒", cmps.year, cmps.month, cmps.day, cmps.hour, cmps.minute, cmps.second);
    NSString *rstr = @"";
    if ([dtype isEqualToString:@"月"]) {
        NSInteger a = cmps.month/30;
        NSInteger y = cmps.year/12;

        rstr = [NSString stringWithFormat:@"%ld",a+1+y];
        if (cmps.month==30) {
            rstr = [NSString stringWithFormat:@"%ld",a];
        }
        else{
            rstr = [NSString stringWithFormat:@"%ld",a+1];
        }
    }
    if ([dtype isEqualToString:@"日"]) {
        NSInteger a = cmps.month*30;
        NSInteger y = cmps.year*365;
//        NSInteger h = cmps.hour;
        
        rstr = [NSString stringWithFormat:@"%ld",cmps.day+a+y];
    }
    if ([dtype isEqualToString:@"小时"]) {
        NSInteger m = cmps.month*30*24;
        NSInteger y = cmps.year*365*24;
        NSInteger d = cmps.day*24;

        if (cmps.hour==24) {
            rstr = [NSString stringWithFormat:@"%ld",d+m+y+cmps.hour];
        }
        else{
            rstr = [NSString stringWithFormat:@"%ld",d+m+y+1+cmps.hour];
        }
    }
    return rstr;
}

+ (int)compareOneDay:(NSString *)oneDay withAnotherDay:(NSString *)anotherDay
{
    int ci;
      NSDateFormatter *df = [[NSDateFormatter alloc] init];
      [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
      NSDate *dt1 = [[NSDate alloc] init];
      NSDate *dt2 = [[NSDate alloc] init];
      dt1 = [df dateFromString:oneDay];
      dt2 = [df dateFromString:anotherDay];
      NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
        {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
        }
    return ci;
    
}



#pragma mark - /*日期加减 自定义天数*/

+ (NSString *)dateWithAddOrSubstract:(NSString *)type ymdType:(NSString *)ymd withAddOrSubNums:(int)nums withNowDate:(NSString *)time{

    NSString *newTime;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];//创建一个日期格式化器
    dateFormatter.dateFormat=@"yyyy-MM-dd HH:mm:ss";//指定转date得日期格式化形式
    NSDate *date = [dateFormatter dateFromString:time];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    //    [lastMonthComps setYear:1]; // year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    
    if ([type isEqualToString:@"add"]) {
        if ([ymd isEqualToString:@"year"]) {
            [lastMonthComps setYear:nums];
        }else if ([ymd isEqualToString:@"mouth"]){
            [lastMonthComps setMonth:nums];
        }else if ([ymd isEqualToString:@"day"]){
            [lastMonthComps setDay:nums];
        }else{
            [lastMonthComps setHour:nums];
        }
    }else{
      if ([ymd isEqualToString:@"year"]) {
          [lastMonthComps setYear:-nums];
      }else if ([ymd isEqualToString:@"mouth"]){
          [lastMonthComps setMonth:-nums];
      }else if ([ymd isEqualToString:@"day"]){
          [lastMonthComps setDay:-nums];
      }else{
           [lastMonthComps setHour:-nums];
      }
    }
    
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    newTime = [dateFormatter stringFromDate:newdate];

    return newTime;

}
#pragma mark - /*日期加减一天*/
+ (NSString *)dateWithAddOrSubstract:(NSString *)type withNowDate:(NSString *)time{
    
    NSString *newTime;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];//创建一个日期格式化器
    dateFormatter.dateFormat=@"yyyy-MM-dd HH:mm:ss";//指定转date得日期格式化形式
    NSDate *date = [dateFormatter dateFromString:time];
    
    if ([type isEqualToString:@"add"]) {
        newTime = [dateFormatter stringFromDate:[date dateByAddingTimeInterval:24*60*60]];
    }else{
        newTime = [dateFormatter stringFromDate:[date dateByAddingTimeInterval:-24*60*60]];
    }
    return newTime;

}
//根据日期返回周几  2019-06-01  或2019/06/01
+ (NSString*)weekDayStr:(NSString*)format{
    
    NSString *weekDayStr = nil;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    if(format.length>=10) {
        NSString *nowString = [format substringToIndex:10];
        NSArray *array = [nowString componentsSeparatedByString:@"-"];
        if(array.count==0) {
            array = [nowString componentsSeparatedByString:@"/"];
        }
        
        if(array.count>=3) {
            NSInteger year = [[array objectAtIndex:0] integerValue];
            NSInteger month = [[array objectAtIndex:1] integerValue];
            NSInteger day = [[array objectAtIndex:2] integerValue];
            [comps setYear:year];
            [comps setMonth:month];
            [comps setDay:day];
        }
    }
    //日历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //获取传入date
    NSDate *_date = [gregorian dateFromComponents:comps];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    NSInteger week = [weekdayComponents weekday];
    switch(week) {
        case 1:
            weekDayStr =@"周日";
            break;
        case 2:
            weekDayStr =@"周一";
            break;
        case 3:
            weekDayStr =@"周二";
            break;
        case 4:
            weekDayStr =@"周三";
            break;
        case 5:
            weekDayStr =@"周四";
            break;
        case 6:
            weekDayStr =@"周五";
            break;
        case 7:
            weekDayStr =@"周六";
            break;
        default:
            weekDayStr =@"";
            break;
    }
    return weekDayStr;
}




+ (NSMutableAttributedString *)atrributeRangString1:(NSString *)rangs1 rangStrTextColor1:(UIColor *)rangColor1 withRangString2:(NSString *)rangs2 rangStrTextColor2:(UIColor *)rangColor2{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",rangs1,rangs2]];
    NSRange range1 = [[str string] rangeOfString:rangs1];
    [str addAttribute:NSForegroundColorAttributeName value:rangColor1 range:range1];
    NSRange range2 = [[str string] rangeOfString:rangs2];
    [str addAttribute:NSForegroundColorAttributeName value:rangColor2 range:range2];
   
    return str;
}
+ (NSMutableAttributedString *)atrributeRangString1:(NSString *)rangs1 rangStrTextColor1:(UIColor *)rangColor1 withRangString2:(NSString *)rangs2 rangStrTextColor2:(UIColor *)rangColor2 withRangString3:(NSString *)rangs3 rangStrTextColor3:(UIColor *)rangColor3{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@ %@",rangs1,rangs2,rangs3]];
    NSRange range1 = [[str string] rangeOfString:rangs1];
    [str addAttribute:NSForegroundColorAttributeName value:rangColor1 range:range1];
    NSRange range2 = [[str string] rangeOfString:rangs2];
    [str addAttribute:NSForegroundColorAttributeName value:rangColor2 range:range2];
   NSRange range3 = [[str string] rangeOfString:rangs3];
    [str addAttribute:NSForegroundColorAttributeName value:rangColor3 range:range3];
    return str;
}
+ (NSString *)judgeTextFieldText:(NSString *)tfString withTfName:(NSString *)tfNmae{
    NSString *svdStr = @"";
    if ([BaseTools judgeBlankString:tfString]) {
        svdStr = [NSString stringWithFormat:@"%@不能为空！",tfNmae];
    }
    
    return svdStr;
}
+ (NSString *)UTF8String:(NSString *)str{

    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)str, NULL, NULL,  kCFStringEncodingUTF8 ));
    return encodedString;
}




//大写转小写
+ (NSString *)stringToLower:(NSString *)str{
    for (NSInteger i = 0; i < str.length; i++) {
        if ([str characterAtIndex:i] >= 'A' & [str characterAtIndex:i] <= 'Z') {
        char temp = [str characterAtIndex:i]+32;
        NSRange range = NSMakeRange(i, 1);
        str = [str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];
        }
    }
    return str;
}

//TODO:--------------打电话
+ (void)telWithPhone:(NSString *)tel{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",tel];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
//TODO:--------------导航
+ (void)navigationWithLat:(NSString *)lat withLng:(NSString *)lng{
    //目的地位置
    CGFloat lation = [lat floatValue];
    CGFloat lngtion = [lng floatValue];

       CLLocationCoordinate2D coords2 = CLLocationCoordinate2DMake(lation,lngtion);
    //当前的位置
       MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
       //起点
       //目的地的位置
       MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coords2 addressDictionary:nil]];
       
       toLocation.name = @"目的地";

//
       NSArray *items = [NSArray arrayWithObjects:currentLocation, toLocation, nil];
       NSDictionary *options = @{ MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey:@YES };
       //打开苹果自身地图应用，并呈现特定的item
       [MKMapItem openMapsWithItems:items launchOptions:options];
}

//TODO:缓存
+ (NSInteger)getCacheSizeWithFilePath:(NSString *)path {
    // 获取“path”文件夹下的所有文件
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];
    NSString *filePath = nil;
    NSInteger totleSize = 0;
    for (NSString *subPath in subPathArr) {
        
        filePath = [path stringByAppendingPathComponent:subPath];
        
        BOOL isDirectory = NO;
        
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        //忽略不需要计算的文件:文件夹不存在/ 过滤文件夹/隐藏文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]) {
            
            continue;
        }
        
        /** attributesOfItemAtPath: 文件夹路径 该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因 */
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        // 计算总大小
        totleSize += size;
    }
    
    return totleSize;
}

//将文件大小转换为 M/KB/B
+ (NSString *)fileSizeConversion:(NSInteger)totalSize {
    
    NSString *totleStr = nil;
    if (totalSize > 1000 * 1000) {
        totleStr = [NSString stringWithFormat:@"%.2fM",totalSize / 1000.00f /1000.00f];
        
    } else if (totalSize > 1000) {
        totleStr = [NSString stringWithFormat:@"%.2fKB",totalSize / 1000.00f ];
        
    } else {
        totleStr = [NSString stringWithFormat:@"%.2fB",totalSize / 1.00f];
        
    }
    return totleStr;
}

//清除path文件夹下缓存
+ (BOOL)clearCacheWithFilePath:(NSString *)path {
    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    NSString *filePath = nil;
    NSError *error = nil;
    for (NSString *subPath in subPathArr) {
        filePath = [path stringByAppendingPathComponent:subPath];
        //删除子文件夹
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
        
    }
    
    return YES;
}
//判断⼿机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile
{
  mobile = [mobile stringByReplacingOccurrencesOfString:@" "withString:@""];
  if (mobile.length != 11)
  {
    return NO;
  }else{
      NSString *pattern = @"^1+[3456789]+\\d{9}";

      NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , pattern];

      BOOL isMatch = [pred evaluateWithObject:mobile];

      return isMatch;
  }
}


@end
