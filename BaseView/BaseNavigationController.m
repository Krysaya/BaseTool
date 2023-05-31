
//
//  BaseNavigationController.m
//  ywt
//
//  Created by q on 2018/11/1.
//  Copyright © 2018年 kris. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;

//    WeakSelf
//        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//            self.interactivePopGestureRecognizer.delegate = weakSelf;
//        }

    // Do any additional setup after loading the view.
}
/**
 能拦截所有push进来的子控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
//    NSLog(@"%@ %lu",viewController,(unsigned long)self.viewControllers.count);
    //如果现在push的不是栈底控制器（最先push进来的那个控制器）
    if (self.viewControllers.count > 0) {
        //隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;

        //全局设置返回按扭
        [self setBackButtonWithVC:viewController];
    }
    
    
    [super pushViewController:viewController animated:animated];
}
-(void)setBackButtonWithVC:(UIViewController*)vc{
    BaseButton *backButton = [BaseButton baseButtonWithFrame:CGRectMake(0, 0, 50, 50) text:@"返回" textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:14] isLayerCornerRadius:NO cornerRadius:1 setImage:@"back" selectImage:@"" backgroundColor:[UIColor clearColor]];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    [backButton sizeToFit];
    // 注意:一定要在按钮内容有尺寸的时候,设置才有效果
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(void)back{
    [self popViewControllerAnimated:NO];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    if(self.viewControllers.count <=1) {
        return NO;
    }
    return  YES;
    
}
// 允许同时响应多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)navigationController:(UINavigationController* )navigationController didShowViewController:(UIViewController* )viewController animated:(BOOL)animated
{
    
     if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
        
          }
     if (navigationController.viewControllers.count == 1) {
            navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    
}

#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
