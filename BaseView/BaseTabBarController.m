
//
//  BaseTabBarController.m
//  ywt
//
//  Created by q on 2018/11/15.
//  Copyright © 2018年 kris. All rights reserved.
//

#import "BaseTabBarController.h"

#import "BaseNavigationController.h"


@interface BaseTabBarController ()
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tabBar.backgroundColor = [UIColor whiteColor];

//    [self addOneChildViewController:[[BaseNavigationController alloc]initWithRootViewController:[[DispatchManagerViewController alloc]init]] WithTitle:@"派单管理" imageName:@"pd_nos" selectedImageName:@"pd_s"];




}



/**
 *  添加一个子控制器
 *
 *  @param viewController    控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */

- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{

    viewController.tabBarItem.title         = title;
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KGrayRGB} forState:UIControlStateNormal];

    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KALLRGB} forState:UIControlStateSelected];
    UIImage *image_default = [UIImage imageNamed:imageName];
    image_default = [image_default imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image         = image_default;
    viewController.tabBarItem.selectedImage = image;
    [self addChildViewController:viewController];

}


@end
