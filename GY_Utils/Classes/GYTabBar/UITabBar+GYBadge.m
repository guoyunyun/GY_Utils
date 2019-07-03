//
//  UITabBar+GYBadge.m
//  TabbarTest
//
//  Created by shuidi_iMac on 2019/3/8.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "UITabBar+GYBadge.h"

@implementation UITabBar (GYBadge)

- (void)gy_ShowBadgeOnItemIndex:(int)index{
    
    [self gy_removeBadgeOnItemIndex:index];
    
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 100 + index;
    badgeView.layer.cornerRadius = 5;
    badgeView.backgroundColor = [UIColor redColor];
    
    CGRect tabbarFrame = self.frame;
    //tabbarItems 索引从第0个开始， 第0个 + 0.6表示第一个
    float percentX = (index +0.6) / GYTabbarItemNums;
    CGFloat x = ceilf(percentX * tabbarFrame.size.width);
    CGFloat y = ceilf(0.1 * tabbarFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);
    [self addSubview:badgeView];
    
}

- (void)gy_HidenBadgeOnItemIndex:(int)index{
    
    [self gy_removeBadgeOnItemIndex:index];
}

- (void)gy_removeBadgeOnItemIndex:(int)index{
    
    for (UIView *subView in self.subviews) {
        if (subView.tag == 100 + index) {
            [subView removeFromSuperview];
        }
    }
}


@end
