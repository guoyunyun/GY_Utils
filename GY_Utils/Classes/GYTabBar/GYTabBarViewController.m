//
//  GYTabBarViewController.m
//  MCTabBarController
//
//  Created by shuidi_iMac on 2019/3/15.
//  Copyright © 2019 caohouhong. All rights reserved.
//

#import "GYTabBarViewController.h"

@interface GYTabBarViewController ()<UITabBarControllerDelegate>

@end

@interface GYTabBarViewController ()

@end

@implementation GYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _gyTabBar = [[GYTabBar alloc] init];
    [_gyTabBar.centerButton addTarget:self action:@selector(centerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setValue:_gyTabBar forKey:@"tabBar"];
    self.delegate = self;
}

//重写
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    _gyTabBar.centerButton.selected = (tabBarController.selectedIndex == self.viewControllers.count/2);
    
    NSLog(@"tabBarController selected %ld",(long)tabBarController.selectedIndex);
    
    if (self.tabDelegate) {
        [self.tabDelegate gyTabBarController:tabBarController didSelectViewController:viewController];
    }
}


- (void)centerAction:(UIButton *)button{
    
    self.selectedIndex = self.viewControllers.count/2;
    
    //关联tabbarController事件
    [self tabBarController:self didSelectViewController:self.viewControllers[self.selectedIndex]];
}






@end
