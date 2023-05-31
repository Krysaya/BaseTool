//
//  BaseNavTitleView.h
//  yibuCar
//
//  Created by q on 2020/11/25.
//  Copyright © 2020 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavTitleView : UIView
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) BaseButton *btn_back;
@property (nonatomic, strong) BaseButton *btn_right;
@end

NS_ASSUME_NONNULL_END
