
//
//  BaseButton.m
//  ywt
//
//  Created by q on 2019/12/17.
//  Copyright © 2019 kris. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton
+(instancetype)baseButtonWithFrame:(CGRect)frame
           text:(NSString *)text
      textColor:(UIColor *)textColor
           font:(UIFont *)font
  isLayerCornerRadius:(BOOL)isCorner
cornerRadius:(CGFloat)corner
        setImage:(NSString *)img
selectImage:(NSString *)selectimg
        backgroundColor:(UIColor *)bgColor{
    BaseButton *btn = [[BaseButton alloc]initWithFrame:frame];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectimg] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:selectimg] forState:UIControlStateSelected|UIControlStateHighlighted];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    btn.layer.cornerRadius = corner;
    btn.layer.masksToBounds = isCorner;
    [btn setBackgroundColor:bgColor];
    return btn;
}
+ (instancetype)baseButtonWithFrame:(CGRect)frame text:(NSString *)text setImage:(NSString *)img {
    BaseButton *btn = [[BaseButton alloc]initWithFrame:frame];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
 

    return btn;
}
+ (instancetype)baseButtonWithFrame:(CGRect)frame text:(NSString *)text setImage:(NSString *)img isEdg:(BOOL)isEdgs{
    BaseButton *btn = [[BaseButton alloc]initWithFrame:frame];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    
    
    if (isEdgs==YES) {
        [btn setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];

    }else{
        [btn setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];

    }
//

    return btn;
}
//+ (instancetype)baseButtonWithFrame:(CGRect)frame text:(NSString *)text setTextColor:(UIColor *)color setTextSelcetColor:(UIColor *)color {
//    BaseButton *btn = [[BaseButton alloc]initWithFrame:frame];
//
//    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [btn setTitle:text forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
//    btn.qi_eventInterval = 1.0;
//
//    return btn;
//}
@end
