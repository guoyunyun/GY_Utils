//
//  GYImageHandle.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYImageHandle : NSObject

//  屏幕截图
+ (UIImage *)screenShotWithFrame:(CGRect )imageRect renderView:(UIView *)view;

//  读取pdf
+ (nullable UIImage *)imageWithPDF:(id)dataOrPath;

/**
 根据颜色大小创建图片

 @param color 指定颜色
 @param size 指定大小
 @return 图片
 */
+ (nullable UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//图片切圆角
+ (nullable UIImage *)imageByRoundCornerWithImage:(UIImage *)image
                                           Radius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;







@end

NS_ASSUME_NONNULL_END
