//
//  BaseNetWorking.h
//  ywt
//
//  Created by q on 2019/3/27.
//  Copyright © 2019年 kris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMNetworking.h"
NS_ASSUME_NONNULL_BEGIN
//typedef void(^BaseNetSuccessBlock)(id respondsObject);
//typedef void(^BaseNetFailureBlock)(NSError *error);



@interface BaseNetWorking : NSObject
+ (void)requestNormalDataParam:(NSDictionary *)params withRequestURL:(NSString *)URL  withISRequestType:(BOOL)requestType withMethodType:(XMHTTPMethodType)type withSuccessBlock:(nullable XMSuccessBlock)successBlock withFailure:(nullable XMFailureBlock)failureBlock;

+ (void)requestNewNormalDataHeader:(NSDictionary *)header withAuthorization:(BOOL)author withParam:(NSDictionary *)params withRequestURL:(NSString *)URL withISRequestType:(BOOL)requestType withMethodType:(XMHTTPMethodType)type withSuccessBlock:(nullable XMSuccessBlock)successBlock withFailure:(nullable XMFailureBlock)failureBlock;


+ (void)requestNewNormalDataHeaderWithParam:(NSDictionary *)params withRequestURL:(NSString *)URL withISRequestType:(BOOL)requestType withMethodType:(XMHTTPMethodType)type withSuccessBlock:(nullable XMSuccessBlock)successBlock withFailure:(nullable XMFailureBlock)failureBlock;

+ (void)refrenshTokenDataCode:(NSNumber* )code withSuccessBlock:(nullable XMSuccessBlock)successBlock;

@end

NS_ASSUME_NONNULL_END
