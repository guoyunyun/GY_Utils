//
//  UIApplication+GYApplication.m
//  GY_Utils
//
//  Created by Ethan on 2020/4/2.
//

#import "UIApplication+GYApplication.h"

@implementation UIApplication (GYApplication)

- (UIWindow *)mainWindow {
    return self.delegate.window;
}

- (UINavigationController *)visibleNavigationController {
    return [[self visibleViewController] navigationController];
}

- (UIViewController *)visibleViewController {
    UIViewController *rootviewcontroller = [self.mainWindow rootViewController];
    return [self getVisibleViewControllerFrom:rootviewcontroller];
}

//逐层遍历，获取当前所在控制器
- (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc)visibleViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]){
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc)selectedViewController]];
    }else{
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        }else{
            return vc;
        }
    }
}

@end
