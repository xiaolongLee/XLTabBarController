//
//  BugleTabBarController.m
//  XLTabBarController
//
//  Created by Mac-Qke on 2018/12/25.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import "BugleTabBarController.h"
#import "ViewController.h"
#import "BaseNavigationController.h"
@interface BugleTabBarController ()<XLTabBarControllerDelegate>

@end

@implementation BugleTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     //选中时的颜色
    self.xlTabbar.tintColor = [UIColor colorWithRed:251.0/255.0 green:199.0/255.0 blue:115/255.0 alpha:1];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.xlTabbar.translucent  = NO;
    
    self.xlTabbar.position = XLTabBarCenterButtonPositionBulag;
    self.xlTabbar.centerImage = [UIImage imageNamed:@"tabbar_add_yellow"];
    self.xlDelegate = self;
    [self addChildViewControllers];
}


//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"首页" andImageName:@"tab1"];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"应用" andImageName:@"tab2"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"发布" andImageName:@""];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"消息" andImageName:@"tab3"];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"我的" andImageName:@"tab4"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName{
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    // 选中的颜色由tabbar的tintColor决定
    childVC.tabBarItem.selectedImage =  [UIImage imageNamed:imageName];
    childVC.title = title;
    
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
}

// 使用XLTabBarController 自定义的 选中代理
- (void)xlTabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (tabBarController.selectedIndex == 2) {
        [self rotationAnimation];
    }else{
        [self.xlTabbar.centerBtn.layer removeAllAnimations];
    }
}

//旋转动画
- (void)rotationAnimation{
    if ([@"key" isEqualToString:[self.xlTabbar.centerBtn.layer animationKeys].firstObject]) {
        return;
    }
    
    CABasicAnimation *rotationAnimation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [self.xlTabbar.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
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
