//
//  GYDateUtils.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2019/2/12.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYDateUtils : NSObject


//  本周的第一天和最后一天
+ (NSArray *)getWeekDateIsLast:(BOOL)isLast;

//  本月的第一天和最后一天
+ (NSArray *)getMonthDateIsLast:(BOOL)isLast;

//  本年的第一天和最后一天
+ (NSArray *)getYearDateIsLast:(BOOL)isLast;

//  本季度日期
+ (NSArray *)getQuarterDateIsLast:(BOOL)isLast;

@end

NS_ASSUME_NONNULL_END
