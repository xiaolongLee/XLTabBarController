//
//  XLTabBarController.m
//  XLTabBarController
//
//  Created by Mac-Qke on 2018/12/25.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import "XLTabBarController.h"

@interface XLTabBarController ()<UITabBarControllerDelegate>

@end

@implementation XLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _xlTabbar = [[XLTabBar alloc] init];
    [_xlTabbar.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:_xlTabbar forKey:@"tabBar"];
    self.delegate = self;
}


// 重写选中事件， 处理中间按钮选中问题
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    _xlTabbar.centerBtn.selected = (tabBarController.selectedIndex == self.viewControllers.count/2);
    
    if (self.xlDelegate) {
        [self.xlDelegate xlTabBarController:tabBarController didSelectViewController:viewController];
    }
}

- (void)buttonAction:(UIButton *)button{
    NSInteger count = self.viewControllers.count;
    self.selectedIndex = count/2;
    [self tabBarController:self didSelectViewController:self.viewControllers[self.selectedIndex]];
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
