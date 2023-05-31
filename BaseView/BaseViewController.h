//
//  BaseViewController.h
//  ywt
//
//  Created by q on 2018/11/15.
//  Copyright © 2018年 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property(nonatomic,strong)UIImageView *img_bg;
@property(nonatomic,strong)UILabel *lab_bg;
@property (nonatomic, strong) BaseLabel *lab_base;//
@property (nonatomic, strong) BaseButton *btn_back;//

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
