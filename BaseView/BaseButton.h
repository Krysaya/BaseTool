//
//  BaseButton.h
//  ywt
//
//  Created by q on 2019/12/17.
//  Copyright © 2019 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseButton : UIButton
+ (instancetype)baseButtonWithFrame:(CGRect)frame text:(NSString *)text setImage:(NSString *)img isEdg:(BOOL)isEdgs;
+ (instancetype)baseButtonWithFrame:(CGRect)frame text:(NSString *)text setImage:(NSString *)img;
+(instancetype)baseButtonWithFrame:(CGRect)frame
           text:(NSString *)text
      textColor:(UIColor *)textColor
           font:(UIFont *)font
  isLayerCornerRadius:(BOOL)isCorner
cornerRadius:(CGFloat)corner
        setImage:(NSString *)img
selectImage:(NSString *)selectimg
backgroundColor:(UIColor *)bgColor;
@end

NS_ASSUME_NONNULL_END
