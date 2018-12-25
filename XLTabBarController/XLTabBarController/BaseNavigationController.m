//
//  BaseNavigationController.m
//  XLTabBarController
//
//  Created by Mac-Qke on 2018/12/25.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置了NO之后View自动下沉navigationBar的高度
    self.navigationBar.translucent   = NO;
    
    //改变左右Item的颜色
   // self.navigationItem.tinColor = [UIColor whiteColor];
    
    //改变title的字体样式
//    NSDictionary *textAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName: [UIFont boldSystemFontOfSize:18]};
//    [self.navigationBar setTitleTextAttributes:textAttributes];
    
    //改变navBar的背景颜色
    [self.navigationBar setBarTintColor:[UIColor blueColor]];
    
    
}


//重写这个方法，在跳转后自动隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self.viewControllers count] > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        //可以在这里定义返回按钮等
//        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//        viewController.navigationItem.leftBarButtonItem = backItem  ;
        
    }
    
     //一定要写在最后，要不然无效
    [super pushViewController:viewController animated:YES];
    //处理了push后隐藏底部UITabBar的情况，并解决了iPhonX上push时UITabBar上移的问题。
    CGRect rect = self.tabBarController.tabBar.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    self.tabBarController.tabBar.frame = rect;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
