

//
//  BaseModel.m
//  yibuCar
//
//  Created by q on 2020/12/22.
//  Copyright © 2020 kris. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
MJCodingImplementation
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if (oldValue==nil) {// 以字符串类型为例
        return  @"";
    }
    if ([oldValue isEqual:[NSNull null]]) {// 以字符串类型为例
        return  @"";
    }
   if ([oldValue isKindOfClass:[NSNull class]]) {// 以字符串类型为例
       return  @"";
   }
    
    return oldValue;
}
@end
