//
//  GYImageHandle.m
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import "GYImageHandle.h"

@implementation GYImageHandle

+ (UIImage *)screenShotWithFrame:(CGRect )imageRect renderView:(UIView *)view{
    
    if (imageRect.size.width) {
        UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, 0.0);
    }else{
        UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) , NO, 0.0);
    }
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenShotImage;
}




@end
