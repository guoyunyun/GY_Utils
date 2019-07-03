//
//  UIColor+GYExtend.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/5/14.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (GYExtend)

+ (UIColor *)colorWithHtmlColor:(NSString *)htmlColor alpha:(float)alpha;

+ (UIColor *)colorWithHtmlColor:(NSString *)htmlColor;

//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;



@end

NS_ASSUME_NONNULL_END
