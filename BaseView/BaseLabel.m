
//
//  BaseLabel.m
//  ywt
//
//  Created by q on 2019/10/28.
//  Copyright © 2019 kris. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

+(instancetype)labelWithFrame:(CGRect)frame
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                         font:(UIFont *)font
                textAlignment:(NSTextAlignment)textAlignment
              backgroundColor:(UIColor *)bgColor
{
    BaseLabel *szkLabel=[[BaseLabel alloc]initWithFrame:frame];
    szkLabel.text=text;
    szkLabel.textColor=textColor;
    szkLabel.font=font;
    szkLabel.textAlignment=textAlignment;
    szkLabel.backgroundColor=bgColor;
    return szkLabel;
}

@end
