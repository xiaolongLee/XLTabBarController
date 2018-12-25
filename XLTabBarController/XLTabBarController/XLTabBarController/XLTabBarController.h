//
//  XLTabBarController.h
//  XLTabBarController
//
//  Created by Mac-Qke on 2018/12/25.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLTabBar.h"
NS_ASSUME_NONNULL_BEGIN
@protocol XLTabBarControllerDelegate <UITabBarControllerDelegate>

// 重写了选中方法，主要处理中间item选中事件
- (void)xlTabBarController:(UITabBarController *)tabBarController
   didSelectViewController:(UIViewController *)viewController;


@end

@interface XLTabBarController : UITabBarController
@property (nonatomic, weak) id<XLTabBarControllerDelegate> xlDelegate;
@property (nonatomic, strong) XLTabBar *xlTabbar;
@end

NS_ASSUME_NONNULL_END
