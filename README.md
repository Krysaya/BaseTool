# 基础工具
**字符串时间格式化**

`getCurrentTimesWithNowDate`

***


**以sss为单位的时时间戳**

`getNowTimeTimestampWithNowDate`

***
**检查字符非空 nil null @‘’ null>**

 `judgeBlankString`

***
 
**根据正则表达式校验字符串**

 `validateStr:withRegex`

***
**字符串md5加密**

 ```
 + (NSString *)md5:(NSString *)input{
    const char *cStr = [input UTF8String];
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

 ```

***
**字符串sha1加密**

```
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
```  

***
**app内拨打电话**

 ```
 + (void)telWithPhone:(NSString *)tel{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",tel];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

 ```

***
**清除缓存文件**

 `getNowTimeTimestampWithNowDate`

***
**文件大小转换 m/kb/b**

 ```
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


 ```

***
**计算缓存文件大小**

 `getCacheSizeWithFilePath`

***
**校验简单手机号**

 `valiMobile`

***
