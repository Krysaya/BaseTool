//
//  BaseLabel.h
//  ywt
//
//  Created by q on 2019/10/28.
//  Copyright © 2019 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseLabel : UILabel
+(instancetype)labelWithFrame:(CGRect)frame
           text:(NSString *)text
      textColor:(UIColor *)textColor
           font:(UIFont *)font
  textAlignment:(NSTextAlignment)textAlignment
backgroundColor:(UIColor *)bgColor;
@end

NS_ASSUME_NONNULL_END
