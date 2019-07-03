//
//  NSString+GYExtend.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/5/21.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GYVersionModel) {
    GYVersionModelNone = 0,
    GYVersionModelEqual = 1,
    GYVersionModelBig = 2,
    GYVersionModelSmall = 3
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GYExtend)

/**
 *  邮箱的有效性
 */
- (BOOL)isEmailAddress;

/**
 *  纯汉字
 */
- (BOOL)isValidChinese;

/**
 版本号比较
 */
- (GYVersionModel)compareVersiononlineVersion:(NSString *)version;





@end

NS_ASSUME_NONNULL_END
