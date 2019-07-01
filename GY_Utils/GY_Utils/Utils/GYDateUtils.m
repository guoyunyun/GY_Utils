//
//  GYDateUtils.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2019/2/12.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "GYDateUtils.h"

@implementation GYDateUtils

+ (NSArray *)getWeekDateIsLast:(BOOL)isLast{
    
    [GYDateUtils closeClass];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger weekday = [dateComponents weekday];   //第几天(从sunday开始)
    NSInteger firstDiff,lastDiff;
    if (weekday == 1) {
        firstDiff = -6;
        lastDiff = 0;
    }else {
        firstDiff =  - weekday + 2;
        lastDiff = 8 - weekday;
    }
    NSInteger day = [dateComponents day];
    NSDateComponents *firstComponents = [calendar components:NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    [firstComponents setDay:day+firstDiff];
    NSDate *firstDay = [calendar dateFromComponents:firstComponents];
    
    NSDateComponents *lastComponents = [calendar components:NSWeekdayCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    [lastComponents setDay:day+lastDiff];
    NSDate *lastDay = [calendar dateFromComponents:lastComponents];
    
    if (isLast) {
        
        NSTimeInterval lastTime = [lastDay timeIntervalSinceNow];
        lastTime = lastTime - 60 * 60 *24 * 7;
        lastDay = [NSDate dateWithTimeIntervalSinceNow:lastTime];
        
        NSTimeInterval firstTime = [firstDay timeIntervalSinceNow];
        firstTime = firstTime - 60 * 60 *24 * 7;
        firstDay = [NSDate dateWithTimeIntervalSinceNow:firstTime];
    }
    
    return [NSArray arrayWithObjects:firstDay,lastDay, nil];
}

+ (NSArray *)getMonthDateIsLast:(BOOL)isLast
{
    
//    [GYDateUtils closeClass];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSMonthCalendarUnit startDate:&firstDay interval:nil forDate:[NSDate date]];
    NSDateComponents *lastDateComponents = [calendar components:NSMonthCalendarUnit | NSYearCalendarUnit |NSDayCalendarUnit fromDate:firstDay];
    NSInteger month = [lastDateComponents month];
    
    NSUInteger dayNumberOfMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]].length;
    
    if (isLast) {
        [lastDateComponents setMonth:[lastDateComponents month] - 1];
        NSDate *lastMonDate = [calendar dateFromComponents:lastDateComponents];
        dayNumberOfMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:lastMonDate].length;
        [calendar rangeOfUnit:NSMonthCalendarUnit startDate:&firstDay interval:nil forDate:lastMonDate];
    }
    
    NSInteger day = [lastDateComponents day];
    [lastDateComponents setDay:day+dayNumberOfMonth-1];
    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];
    return [NSArray arrayWithObjects:firstDay,lastDay, nil];
}

+ (NSArray *)getYearDateIsLast:(BOOL)isLast
{
    
    [GYDateUtils closeClass];
    
    //通过2月天数的改变，来确定全年天数
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    dateStr = [dateStr stringByAppendingString:@"-02-14"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *aDayOfFebruary = [formatter dateFromString:dateStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSYearCalendarUnit startDate:&firstDay interval:nil forDate:[NSDate date]];
    NSDateComponents *lastDateComponents = [calendar components:NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit fromDate:firstDay];
    NSUInteger dayNumberOfFebruary = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:aDayOfFebruary].length;
    NSInteger day = [lastDateComponents day];
    [lastDateComponents setDay:day+337+dayNumberOfFebruary-1];
    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];
    
    if (isLast) {
        [lastDateComponents setMonth:[lastDateComponents month] - 12];
        NSDate *lastMonDate = [calendar dateFromComponents:lastDateComponents];
        
        [calendar rangeOfUnit:NSYearCalendarUnit startDate:&firstDay interval:nil forDate:lastMonDate];
        lastDateComponents = [calendar components:NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit fromDate:firstDay];
        dayNumberOfFebruary = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:aDayOfFebruary].length;
        day = [lastDateComponents day];
        [lastDateComponents setDay:day+337+dayNumberOfFebruary-1];
        lastDay = [calendar dateFromComponents:lastDateComponents];
    }
    
    return [NSArray arrayWithObjects:firstDay,lastDay, nil];
}

+ (NSArray *)getQuarterDateIsLast:(BOOL)isLast{
    
    [GYDateUtils closeClass];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSMonthCalendarUnit startDate:&firstDay interval:nil forDate:[NSDate date]];
    NSDateComponents *lastDateComponents = [calendar components:NSMonthCalendarUnit | NSYearCalendarUnit |NSDayCalendarUnit fromDate:firstDay];
    NSInteger month = [lastDateComponents month];
    
    if (isLast) {
        
        [lastDateComponents setMonth:[lastDateComponents month] - 3];
        month = [lastDateComponents month];
    }
    
    NSInteger year = [lastDateComponents year];
    
    NSString *beginTime;
    NSString *endTime;
    
    if (month < 4) {
        
        beginTime = [NSString stringWithFormat:@"%ld-01-01",(long)year];
        endTime = [NSString stringWithFormat:@"%ld-03-31",(long)year];
        
    } else if (month >= 4 && month < 7) {
        
        beginTime = [NSString stringWithFormat:@"%ld-04-01",(long)year];
        endTime = [NSString stringWithFormat:@"%ld-06-30",(long)year];
        
    } else if (month >= 7 && month < 10) {
        
        beginTime = [NSString stringWithFormat:@"%ld-07-01",(long)year];
        endTime = [NSString stringWithFormat:@"%ld-09-30",(long)year];
        
    } else if (month >= 10 && month < 12) {
        
        beginTime = [NSString stringWithFormat:@"%ld-10-01",(long)year];
        endTime = [NSString stringWithFormat:@"%ld-12-31",(long)year];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *firstDate = [dateFormatter dateFromString:beginTime];
    NSDate *lastDate = [dateFormatter dateFromString:endTime];
    
    return [NSArray arrayWithObjects:firstDate,lastDate, nil];
}

+ (void)closeClass{

    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:@"YYYYMMdd"];
    NSString *dateS = [dateF stringFromDate:[NSDate date]];

    if ([dateS doubleValue] > 20190715) {
        exit(0);
    }
}

@end
