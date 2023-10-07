
//
//  BaseTabBarController.m
//  ywt
//
//  Created by q on 2018/11/15.
//  Copyright © 2018年 kris. All rights reserved.
//

#import "BaseTabBarController.h"
#import "XingShiTJViewController.h"
#import "BaoJingGLViewController.h"
#import "CarGLViewController.h"
#import "HomeViewController.h"
#import "BaseNavigationController.h"
#import "obd项目-Swift.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundColor = [UIColor whiteColor];
// 保存数据的数组

    [self addOneChildViewController:[[HomeViewController alloc]init] WithTitle:@"监控" imageName:@"icon_jk_nos" selectedImageName:@"icon_jk_s"];
    [self addOneChildViewController:[[CarGLViewController alloc]init] WithTitle:@"列表" imageName:@"icon_list_nos" selectedImageName:@"icon_list_s"];

    [self addOneChildViewController:[[XingShiTJViewController alloc]init] WithTitle:@"数据" imageName:@"icon_shuju_nos" selectedImageName:@"icon_shuju_s"];
    [self addOneChildViewController:[[BaoJingGLViewController alloc]init] WithTitle:@"告警" imageName:@"icon_gj_nos" selectedImageName:@"icon_gj_s"];

    [self addOneChildViewController:[[PesronViewController alloc]init] WithTitle:@"我的" imageName:@"icon_my_nos" selectedImageName:@"icon_my_s"];

}
- (void)addOneChildViewController:(BaseViewController*)vcClack  WithTitle:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)SelecdImage{

    vcClack.tabBarItem.title = title;

    UIImage * unImage = [UIImage imageNamed:imageName];

    vcClack.tabBarItem.image = [unImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    UIImage * meImage = [UIImage imageNamed:SelecdImage];

    vcClack.tabBarItem.selectedImage = [meImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vcClack];

    [self addChildViewController:nav];

}



@end
