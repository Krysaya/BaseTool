
//
//  BaseNavTitleView.m
//  yibuCar
//
//  Created by q on 2020/11/25.
//  Copyright © 2020 kris. All rights reserved.
//

#import "BaseNavTitleView.h"
@interface BaseNavTitleView()
@property (nonatomic, strong) BaseLabel *lab_title;

@end

@implementation BaseNavTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self) {
        self =  [super initWithFrame:frame];
        self.backgroundColor = [UIColor whiteColor];
        
        BaseLabel *lab_title = [BaseLabel labelWithFrame:CGRectMake(SreenW/2-50, SafeAreaTopHeight/2, 100, 30) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:lab_title];
        self.lab_title = lab_title;
        
        BaseButton *btn_back = [BaseButton baseButtonWithFrame:CGRectMake(0, SafeAreaTopHeight/2, 50, 30) text:@"" setImage:@"back"];
        [self addSubview:btn_back];
        self.btn_back = btn_back;
        
        BaseButton *btn_right = [BaseButton baseButtonWithFrame:CGRectMake(SreenW-80, SafeAreaTopHeight/2, 80, 30) text:@"" setImage:@""];
        btn_right.titleLabel.font  = KFontSize(15);
        [self addSubview:btn_right];
        self.btn_right = btn_right;
    }
    return self;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.lab_title.text = title;
}
@end
