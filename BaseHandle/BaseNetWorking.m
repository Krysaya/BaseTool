
//
//  BaseNetWorking.m
//  ywt
//
//  Created by q on 2019/3/27.
//  Copyright © 2019年 kris. All rights reserved.
//
#import "BaseNetWorking.h"

@implementation BaseNetWorking
+ (void)requestNormalDataParam:(NSDictionary *)params withRequestURL:(NSString *)URL  withISRequestType:(BOOL)requestType withMethodType:(XMHTTPMethodType)type withSuccessBlock:(nullable XMSuccessBlock)successBlock withFailure:(nullable XMFailureBlock)failureBlock {

//接口调成功--
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.url = URL;
        request.httpMethod = type;
        request.headers = @{@"Content-Type":@"application/json"};
        request.parameters = params;
        request.timeoutInterval = 10;
        if (requestType==YES) {
                request.requestSerializerType = kXMRequestSerializerJSON;
        }
        
    }  onSuccess:^(id  _Nullable responseObject) {
        NSNumber *numstate = responseObject[@"code"];
        
        if ([numstate intValue]==200) {
//            [SVProgressHUD showSuccessWithStatus:responseObject[@"msg"]];

            NSDictionary *dict = [NSDictionary changeType:responseObject];
            successBlock(dict);
        }else{
            [SVProgressHUD showInfoWithStatus:responseObject[@"msg"]];

        }
       
        
    } onFailure:^(NSError * _Nullable error) {
        [SVProgressHUD showInfoWithStatus:@"网络异常"];
        failureBlock(error);
    }];
}

+ (void)requestNewNormalDataHeader:(NSDictionary *)header withAuthorization:(BOOL)author withParam:(NSDictionary *)params withRequestURL:(NSString *)URL withISRequestType:(BOOL)requestType withMethodType:(XMHTTPMethodType)type withSuccessBlock:(nullable XMSuccessBlock)successBlock withFailure:(nullable XMFailureBlock)failureBlock {
    NSMutableDictionary *h_dic = @{}.mutableCopy;
    NSString *token = GetUserDefaults(ACCESS_TOKEN);
    NSString *authorization = [NSString stringWithFormat:@"Bearer %@",token];
    if (author==YES) {
        [h_dic addEntriesFromDictionary:@{@"Authorization":authorization}];
        [h_dic addEntriesFromDictionary:header];
    }else{
        [h_dic addEntriesFromDictionary:header];

    }
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.url = URL;
        request.headers = header;
        request.httpMethod = type;
        request.parameters = params;
        
        
        if (requestType==YES) {
          request.requestSerializerType = kXMRequestSerializerJSON;
        }
    }  onSuccess:^(id  _Nullable responseObject) {
        NSNumber *numstate = responseObject[@"code"];
        if ([numstate intValue]==200) {

            NSDictionary *dict = [NSDictionary changeType:responseObject];
            successBlock(dict);
        }else if([numstate intValue]==401||[numstate intValue]==1003||[numstate intValue]==1001){
            [SVProgressHUD showInfoWithStatus:@"请重新登录！"];
            [[NSNotificationCenter defaultCenter]postNotificationName:NFC_ISRELOGIN object:nil];
        }else{
            [SVProgressHUD showInfoWithStatus:responseObject[@"msg"]];

        }
        
    } onFailure:^(NSError * _Nullable error) {
        [SVProgressHUD showInfoWithStatus:@"网络异常"];
         failureBlock(error);
    }];
}

+ (void)requestNewNormalDataHeaderWithParam:(NSDictionary *)params withRequestURL:(NSString *)URL withISRequestType:(BOOL)requestType withMethodType:(XMHTTPMethodType)type withSuccessBlock:(nullable XMSuccessBlock)successBlock withFailure:(nullable XMFailureBlock)failureBlock {

    NSString *token = GetUserDefaults(ACCESS_TOKEN);
//    if (!token) {
//        [[NSNotificationCenter defaultCenter]postNotificationName:NFC_ISRELOGIN object:nil];
//        return;
//    }
    NSString *authorization = [NSString stringWithFormat:@"Bearer %@",token];
    
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.url = URL;
        request.headers = @{@"Content-Type":@"application/json",@"Authorization":authorization};
        request.httpMethod = type;
        request.parameters = params;
        
        if (requestType==YES) {
          request.requestSerializerType = kXMRequestSerializerJSON;
        }
    }  onSuccess:^(id  _Nullable responseObject) {
        NSNumber *numstate = responseObject[@"code"];
        if ([numstate intValue]==200) {

            NSDictionary *dict = [NSDictionary changeType:responseObject];
            successBlock(dict);
        }else if([numstate intValue]==401||[numstate intValue]==1003||[numstate intValue]==1001){
            [SVProgressHUD showInfoWithStatus:@"请重新登录！"];
            [[NSNotificationCenter defaultCenter]postNotificationName:NFC_ISRELOGIN object:nil];
        }else{
            NSDictionary *dict = [NSDictionary changeType:responseObject];
            successBlock(dict);

            [SVProgressHUD showInfoWithStatus:responseObject[@"msg"]];

        }
        
    } onFailure:^(NSError * _Nullable error) {
        [SVProgressHUD showInfoWithStatus:@"网络异常"];
         failureBlock(error);
    }];
}
@end
