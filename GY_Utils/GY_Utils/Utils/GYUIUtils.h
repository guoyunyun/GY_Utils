//
//  GYUIUtils.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/6/14.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYUIUtils : NSObject

/**
 开始倒计时
 
 @param totalTime 需要倒计时的时长，单位秒
 @param action 倒计时block，里面返回的是剩余时长，单位秒
 */
- (void)beginCountdown:(NSInteger)totalTime action:(void(^)(NSInteger endDuration))action;

/** 取消倒计时 */
- (void)cancelCountdown;

///传入一个秒数，返回时分秒格式的字符串
+ (NSString *)formatTimeStr:(NSInteger)secondNumber;

///传入一个秒数，返回有几个小时
+ (NSString *)formatFewHours:(NSInteger)secondNumber;

///传入一个秒数，返回有多少分钟
+ (NSString *)formatFewMinute:(NSInteger)secondNumber;




@end

NS_ASSUME_NONNULL_END
