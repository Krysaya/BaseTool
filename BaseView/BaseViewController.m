
//
//  BaseViewController.m
//  ywt
//
//  Created by q on 2018/11/15.
//  Copyright © 2018年 kris. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    BaseLabel *lab_title  = [BaseLabel labelWithFrame:CGRectMake(50, SafeAreaStatusBarHeight, SreenW-100, 30) text:@"" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:lab_title];
    self.lab_base = lab_title;

    
    UIImageView *img_bg = [[UIImageView alloc]initWithFrame:CGRectMake((SreenW-300)/2, 200, 300, 209)];
    img_bg.image = [UIImage imageNamed:@"p_noimg"];
    img_bg.hidden = YES;
    [self.view addSubview:img_bg];
    self.img_bg = img_bg;
    
    BaseLabel *lab  = [BaseLabel labelWithFrame:CGRectMake((SreenW-300)/2, 310, 300, 30) text:@"暂无数据" textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:16] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    lab.hidden = YES;
    [self.view addSubview:lab];
    self.lab_bg = lab;

    BaseButton *backButton = [BaseButton baseButtonWithFrame:CGRectMake(20, 50, 50, 50) text:@"" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14] isLayerCornerRadius:NO cornerRadius:1 setImage:@"back" selectImage:@"" backgroundColor:[UIColor clearColor]];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backButton.hidden = YES;
    [self.view addSubview:backButton];
    self.btn_back  = backButton;
    
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    [self.view endEditing:YES];
    [SVProgressHUD dismiss];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [SVProgressHUD dismiss];
}

//TODO:单色背景
+ (UIImage *)imageWithColor:(UIColor *)color{

       CGRect rect = CGRectMake(0,0, 1, 1);
       UIGraphicsBeginImageContext(rect.size);
       CGContextRef context =UIGraphicsGetCurrentContext();
       CGContextSetFillColorWithColor(context, [color CGColor]);
       CGContextFillRect(context, rect);
       UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
       UIGraphicsEndImageContext();
       return image;

}

@end
