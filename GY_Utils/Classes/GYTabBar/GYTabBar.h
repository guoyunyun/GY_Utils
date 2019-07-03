//
//  GYTabBar.h
//  MCTabBarController
//
//  Created by shuidi_iMac on 2019/3/15.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GYTabBarCenterButtonPoint) {
    
    GYTabBarCenterButtonPointCenter = 0,    //纵向居中
    GYTabBarCenterButtonPointBulge          //凸出
};

NS_ASSUME_NONNULL_BEGIN

@interface GYTabBar : UITabBar

@property (nonatomic, strong) UIButton *centerButton;

@property (nonatomic, strong) UIImage *noramalImage;

@property (nonatomic, strong) UIImage *selectImage;

//纵向偏移量，默认居中
@property (nonatomic, assign) CGFloat centerOffsetY;

//按钮大小，默认图片的大小
@property (nonatomic, assign) CGFloat centerWidth,centerHeight;

@property (nonatomic, assign) GYTabBarCenterButtonPoint buttonPoint;


@end

NS_ASSUME_NONNULL_END
