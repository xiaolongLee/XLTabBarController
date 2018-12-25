//
//  NormalTabBarController.m
//  XLTabBarController
//
//  Created by Mac-Qke on 2018/12/25.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import "NormalTabBarController.h"
#import "ViewController.h"
#import "BaseNavigationController.h"
@interface NormalTabBarController ()

@end

@implementation NormalTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //选中时的颜色
    self.xlTabbar.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.xlTabbar.translucent  = NO;
    self.xlTabbar.centerImage = [UIImage imageNamed:@"tab_unselect_gray"];
    self.xlTabbar.centerSelectedImage = [UIImage imageNamed:@"tab_select_blue"];
    //// 可设置宽高
//    self.xlTabbar.centerWidth = 40;
//    self.xlTabbar.centerHeight = 40;
    [self addChildViewControllers];
}


//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    [self addChildViewController:[[ViewController alloc] init] andTitle:@"首页" andImageName:@"tab1"];
    //中间这个不设置东西，只占位
    [self addChildViewController:[[ViewController alloc] init] andTitle:@"" andImageName:@""];
    [self addChildViewController:[[ViewController alloc] init] andTitle:@"发现" andImageName:@"tab3"];
   
}

- (void)addChildViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName {
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    // 选中的颜色由tabbar的tintColor决定
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:imageName];
    childVC.title = title;
    
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
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
