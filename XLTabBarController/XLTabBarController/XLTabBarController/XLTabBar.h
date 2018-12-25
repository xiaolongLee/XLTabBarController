//
//  XLTabBar.h
//  XLTabBarController
//
//  Created by Mac-Qke on 2018/12/25.
//  Copyright © 2018 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, XLTabBarCenterButtonPosition){
    XLTabBarCenterButtonPositionCenter, // 居中
    XLTabBarCenterButtonPositionBulag // 凸出一半
} ;


@interface XLTabBar : UITabBar
/**
 中间按钮
 */
@property (nonatomic, strong) UIButton *centerBtn;
/**
 中间按钮图片
 */
@property (nonatomic, strong) UIImage *centerImage;

/**
 中间按钮选中图片
 */
@property (nonatomic, strong) UIImage *centerSelectedImage;

/**
 中间按钮偏移量,两种可选，也可以使用centerOffsetY 自定义
 */
@property (nonatomic, assign) XLTabBarCenterButtonPosition position;

/**
 中间按钮偏移量，默认是居中
 */
@property (nonatomic, assign) CGFloat centerOffsetY;

/**
 中间按钮的宽和高，默认使用图片宽高
 */
@property (nonatomic, assign) CGFloat centerWidth, centerHeight;

@end

NS_ASSUME_NONNULL_END
