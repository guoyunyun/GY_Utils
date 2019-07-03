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





@end

NS_ASSUME_NONNULL_END
