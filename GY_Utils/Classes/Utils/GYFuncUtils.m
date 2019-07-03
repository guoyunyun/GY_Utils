//
//  GYFuncUtils.m
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import "GYFuncUtils.h"

@implementation GYFuncUtils

//判断手机号
+ (BOOL)isTurePhoneNum:(NSString *)phoneNum{
    
//    [GYFuncUtils closeClass];
    
    NSString *regexStr = @"^1[3,8]\\d{9}|14[5,7,9]\\d{8}|15[^4]\\d{8}|17[^2,4,9]\\d{8}$";
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) return NO;
    NSInteger count = [regular numberOfMatchesInString:phoneNum options:NSMatchingReportCompletion range:NSMakeRange(0, phoneNum.length)];
    if (count > 0) {
        return YES;
    } else {
        return NO;
    }
}


+ (BOOL)isIap
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [[infoDictionary objectForKey:@"IAP"] boolValue];
}

+ (NSString*)DataTOjsonString:(id)object
{
//    [GYFuncUtils closeClass];
    
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

//  json转其他格式
+ (id)jsonStringToData:(NSString *)str
{
    [GYFuncUtils closeClass];
    
    NSError *error = nil;
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:jsonData
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    if(error){
        NSLog(@"jsonStringToData解析失败：%@",error);
        return nil;
    }
    
    return object;
}

//把没有双引号和用了单引号的json字符串转化为标准格式字符串;
+ (NSString *)changeJsonStringToTrueJsonString:(NSString *)json
{
    // 将没有双引号的替换成有双引号的
    NSString *validString = [json stringByReplacingOccurrencesOfString:@"(\\w+)\\s*:([^A-Za-z0-9_])"
                                                            withString:@"\"$1\":$2"
                                                               options:NSRegularExpressionSearch
                                                                 range:NSMakeRange(0, [json length])];
    
    
    //把'单引号改为双引号"
    validString = [validString stringByReplacingOccurrencesOfString:@"([:\\[,\\{])'"
                                                         withString:@"$1\""
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, [validString length])];
    validString = [validString stringByReplacingOccurrencesOfString:@"'([:\\],\\}])"
                                                         withString:@"\"$1"
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, [validString length])];
    
    //再重复一次 将没有双引号的替换成有双引号的
    validString = [validString stringByReplacingOccurrencesOfString:@"([:\\[,\\{])(\\w+)\\s*:"
                                                         withString:@"$1\"$2\":"
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, [validString length])];
    return validString;
}

+ (NSString *)generateUserName
{
    NSDate *date = [NSDate date];
    NSString *dateStr = [NSString stringWithFormat:@"%lld",(long long)([date timeIntervalSince1970]*1000)];
    NSString *randomDate = [dateStr substringWithRange:NSMakeRange(0, 11)];
    
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    for (int i=0; i<2; i++){
        int figure = (arc4random() % 26) + 97;
        char character = figure;
        NSString *tempString = [NSString stringWithFormat:@"%c", character].uppercaseString;
        [resultStr appendString:tempString];
    }
    
    [resultStr appendString:randomDate];
    
    NSLog(@"%@",resultStr);
    return resultStr;
}

+ (NSString *)generateRegisterKey:(NSString *)userName
                            macId:(NSString *)macId
                              pwd:(NSString *)pwd
{
//    NSString *originStr = [NSString stringWithFormat:@"%@username%@macid%@",pwd,userName,macId];
//    return [MMEncryption md5:originStr];
    
    return nil;
}

//将Beijing日期字符串转为UTC日期字符串
//本地日期格式:2013-08-03 12:53:51
+ (NSString *)getUTCFormateLocalDate:(NSString *)beijingDate
{
//    if (dateFormatterBeijing == nil){
//        dateFormatterBeijing = [[NSDateFormatter alloc] init];
//        //输入格式
//        [dateFormatterBeijing setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:NowTimeZone];
//        [dateFormatterBeijing setTimeZone:timeZone];
//    }
//
//    NSDate *beijingTime = [dateFormatterBeijing dateFromString:beijingDate];
//
//    if (dateFormatterUTC == nil){
//        dateFormatterUTC = [[NSDateFormatter alloc] init];
//        //输出格式
//        [dateFormatterUTC setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone *UTCZone = [NSTimeZone timeZoneWithName:@"UTC"];
//        [dateFormatterUTC setTimeZone:UTCZone];
//    }
//
//    NSString *UTCTime = [dateFormatterUTC stringFromDate:beijingTime];
    
//    return UTCTime;
    return nil;
}

//将Beijing日期字符串转为本地时间字符串
+ (NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate
{
    
//    if (dateFormatterBeijing == nil){
//        dateFormatterBeijing = [[NSDateFormatter alloc] init];
//        //输入格式
//        [dateFormatterBeijing setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:NowTimeZone];
//        [dateFormatterBeijing setTimeZone:timeZone];
//    }
//    NSDate *beijingTime = [dateFormatterBeijing dateFromString:utcDate];
//    
//    if (localDateFormatted == nil) {
//        //输出格式
//        localDateFormatted = [[NSDateFormatter alloc] init];
//        [localDateFormatted setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
//        NSLog(@"localDateFormatted name %@ ", localTimeZone.name);
//        [localDateFormatted setTimeZone:localTimeZone];
//    }
//    
//    NSString *localTime = [localDateFormatted stringFromDate:beijingTime];
//    
//    return localTime;
    
    return nil;
}


//  本地时间转北京时间
+ (NSString *)getBeiJingDataFromLocalData:(NSString *)localData{
    
//    if (localDateFormatted == nil) {
//        //输出格式
//        localDateFormatted = [[NSDateFormatter alloc] init];
//        [localDateFormatted setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
//        NSLog(@"localDateFormatted name %@ ", localTimeZone.name);
//        [localDateFormatted setTimeZone:localTimeZone];
//    }
//
//    NSDate *utc = [localDateFormatted dateFromString:localData];
//
//    if (dateFormatterBeijing == nil){
//        dateFormatterBeijing = [[NSDateFormatter alloc] init];
//        //输入格式
//        [dateFormatterBeijing setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:NowTimeZone];
//        [dateFormatterBeijing setTimeZone:timeZone];
//    }
//    NSString *BeiJingTime = [dateFormatterBeijing stringFromDate:utc];
//
//    return BeiJingTime;
    
    return nil;
}


+ (NSString *)formatStringDataWithString:(NSString *)date format:(NSString *)format{
    
    [GYFuncUtils closeClass];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *utc = [dateFormatter dateFromString:date];
    
    NSDateFormatter *changeDateFormatter = [[NSDateFormatter alloc] init];
    [changeDateFormatter setDateFormat:format];
    NSTimeZone *localTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [changeDateFormatter setTimeZone:localTimeZone];
    
    NSString *formatDate = [changeDateFormatter stringFromDate:utc];
    
    return formatDate;
}

/**
 *  日期转换成星期
 */
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    [GYFuncUtils closeClass];
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    [calendar setTimeZone: [NSTimeZone localTimeZone]];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    [GYFuncUtils closeClass];
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    [GYFuncUtils closeClass];
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

/**
 *  计算时间间隔
 */
+ (NSString *)timeIntervalSpanFrom:(NSString *)beginTime to:(NSString *)endTime{
    //    改时间
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //
    //    NSDate *formDate = [dateFormatter dateFromString:beginTime];
    //    NSDate *toDate = [dateFormatter dateFromString:endTime];
    //
    //    NSTimeInterval span = [toDate timeIntervalSinceDate:formDate];
    //1516349574000
    //1516349574000
    long start  = [beginTime integerValue];
    long end    = [endTime integerValue];
    int  span   = (int)(end - start);
    span /= 1000;
    return [NSString stringWithFormat:@"%d",span];
}

/**
 *  过滤nil
 */
+ (NSString *)filterNilData:(NSString *)input{

    [GYFuncUtils closeClass];
    
    if ([[self class]isNotNULL:input]==YES) {
        return input;
    }else{
        return @"";
    }
    //return input == nil ? @"" : input;
}

/**
 *  判断数据是否为Null,nil
 */
+ (BOOL)isNotNULL:(id)obj{
    return   NULL!=obj && nil!=obj && (NULL)!=obj && (Nil)!=obj  && [NSNull null]!=obj ?  YES: NO ;
}

/**
 *  NSDate转为string 格式为formatter
 */
+ (NSString *)stringDateFromDate:(NSDate *)date formatterString:(NSString *)formatter{
    
    [GYFuncUtils closeClass];
    
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc]init];
    [dateFormatte setDateFormat:formatter];
    
    if (!formatter) {
        [dateFormatte setDateFormat:@"YYYY-MM-dd"];
    }
    
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    
    [dateFormatte setTimeZone:localTimeZone];
    
    NSString *dateString = [dateFormatte stringFromDate:date];
    return dateString;
}

+ (NSString *)timestampChangeToDateString:(NSTimeInterval )timeValue{
    
    [GYFuncUtils closeClass];
    
    timeValue = timeValue / 1000;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

////删除json中的转义字符
+ (id)replacingJson:(NSString *)json{
    
    [GYFuncUtils closeClass];
    
    if ([json hasPrefix:@"\""]){
        //去掉\n
        json = [json stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
        //去掉开头结尾引号
        json = [json substringWithRange:NSMakeRange(1, json.length - 2)];
        //去掉序列化后的斜线
        json = [json stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    }
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:jsonData
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    
    return object;
}


//计算文件大小
+ (NSString *)calculSize:(NSInteger)size
{
    int loopCount = 0;
    int mod=0;
    while (size >=1024)
    {
        mod = size%1024;
        size /= 1024;
        loopCount++;
        if (loopCount > 4)
        {
            break;
        }
    }
    
    CGFloat rate=1;
    int loop = loopCount;
    while (loop--)
    {
        rate *= 1000.0;
    }
    CGFloat fSize = size + (CGFloat)mod/rate;
    NSString *sizeUnit;
    switch (loopCount)
    {
        case 0:
            sizeUnit = [[NSString alloc] initWithFormat:@"%.0fB",fSize];
            break;
        case 1:
            sizeUnit = [[NSString alloc] initWithFormat:@"%0.1fKB",fSize];
            break;
        case 2:
            sizeUnit = [[NSString alloc] initWithFormat:@"%0.2fMB",fSize];
            break;
        case 3:
            sizeUnit = [[NSString alloc] initWithFormat:@"%0.3fGB",fSize];
            break;
        case 4:
            sizeUnit = [[NSString alloc] initWithFormat:@"%0.4fTB",fSize];
            break;
        default:
            break;
    }
    return sizeUnit;
}

+ (void)closeClass{
    
//    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
//    [dateF setDateFormat:@"YYYYMMdd"];
//    NSString *dateS = [dateF stringFromDate:[NSDate date]];
//
//    if ([dateS doubleValue] > 20190715) {
//        exit(0);
//    }
}



@end
