//
//  UIApplication+GYApplication.h
//  GY_Utils
//
//  Created by Ethan on 2020/4/2.
//

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (GYApplication)

- (UIWindow *)mainWindow;

- (UINavigationController *)visibleNavigationController;

- (UIViewController *)visibleViewController;

//逐层遍历，获取当前所在控制器
- (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
