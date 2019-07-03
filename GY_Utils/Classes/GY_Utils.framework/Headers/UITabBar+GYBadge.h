//
//  UITabBar+GYBadge.h
//  TabbarTest
//
//  Created by shuidi_iMac on 2019/3/8.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static float const GYTabbarItemNums = 3.0;  //tabbar的数量 如果是5个设置为5.0

@interface UITabBar (GYBadge)

//  显示红点 用于处理，红点中没有数字的情况
- (void)gy_ShowBadgeOnItemIndex:(int)index;

- (void)gy_HidenBadgeOnItemIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
