//
//  GYUIUtils.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/6/14.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "GYUIUtils.h"

@interface GYUIUtils ()

@property (nonatomic) dispatch_source_t wy_timer;//倒计时;

@end

@implementation GYUIUtils


- (void)beginCountdown:(NSInteger)totalTime action:(void(^)(NSInteger endDuration))action{
    
    //倒计时时长
    __block NSInteger timeout = totalTime; //倒计时时间
    __weak typeof(self) weakself = self;
    self.wy_timer = nil;
    
    if (timeout != 0) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        weakself.wy_timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(weakself.wy_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(weakself.wy_timer, ^{
            
            if(timeout <= 0) {
                //倒计时结束，关闭
                dispatch_source_cancel(weakself.wy_timer);
                weakself.wy_timer = nil;
                
            }else {
                
                timeout --;
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    if(action) {
                        
                        action(timeout);
                    }
                });
            }
        });
        
        dispatch_resume(weakself.wy_timer);
    }
}

/** 取消倒计时 */
- (void)cancelCountdown{
    
    
}

///传入一个秒数，返回时分秒格式的字符串
+ (NSString *)formatTimeStr:(NSInteger)secondNumber{
    
    NSString *hour   = [@(secondNumber/3600) stringValue];
    NSString *minute = [@((secondNumber-([hour integerValue]*3600))/60) stringValue];
    NSString *second = [@(secondNumber-([minute integerValue]*60)-([hour integerValue]*3600)) stringValue];
    if([hour integerValue] < 10) {
        
        hour = [@"0" stringByAppendingString:hour];
    }
    
    if([minute integerValue] < 10) {
        
        minute = [@"0" stringByAppendingString:minute];
    }
    
    if([second integerValue] < 10) {
        
        second = [@"0" stringByAppendingString:second];
    }
    
    return [NSString stringWithFormat:@"%@:%@:%@",hour,minute,second];
}

///传入一个秒数，返回有几个小时
+ (NSString *)formatFewHours:(NSInteger)secondNumber{
    
    return [@(secondNumber/3600) stringValue];
}

///传入一个秒数，返回有多少分钟
+ (NSString *)formatFewMinute:(NSInteger)secondNumber{
    
    NSString *hour   = [@(secondNumber/3600) stringValue];
    return [@((secondNumber-([hour integerValue]*3600))/60) stringValue];
}





@end
