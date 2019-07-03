//
//  GYTabBarViewController.h
//  MCTabBarController
//
//  Created by shuidi_iMac on 2019/3/15.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GYTabBarViewControllerDelegate <UITabBarControllerDelegate>

- (void)gyTabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface GYTabBarViewController : UITabBarController

@property (nonatomic, strong) GYTabBar *gyTabBar;

@property (nonatomic, weak) id <GYTabBarViewControllerDelegate> tabDelegate;


@end

NS_ASSUME_NONNULL_END
