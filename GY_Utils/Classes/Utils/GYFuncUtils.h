//
//  GYFuncUtils.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYFuncUtils : NSObject

//  判断手机号
+ (BOOL)isTurePhoneNum:(NSString *)phoneNum;

//  是否为appStore版本
+ (BOOL)isIap;

+ (NSString*)DataTOjsonString:(id)object;

+ (id)jsonStringToData:(NSString *)str;

+ (NSString *)changeJsonStringToTrueJsonString:(NSString *)json;

+ (NSString *)timeIntervalSpanFrom:(NSString *)beginTime to:(NSString *)endTime;

//  生成随机用户ID
+ (NSString *)generateUserName;

//  生成注册Key
+ (NSString *)generateRegisterKey:(NSString *)userName
                            macId:(NSString *)macId
                              pwd:(NSString *)pwd;

//  将本地日期字符串转为UTC日期字符串
//  本地日期格式:2013-08-03 12:53:51
//  可自行指定输入输出格式
+ (NSString *)getUTCFormateLocalDate:(NSString *)localDate;

//  将Beijing日期字符串转为本地时间字符串
//  输入的Beijing日期格式2013-08-03T04:53:51+0000
+ (NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate;

//  本地时间转北京时间
+ (NSString *)getBeiJingDataFromLocalData:(NSString *)localData;


//+ (NSDate *)getNowDateFromatAnDate:(NSString *)date;

//  格式化string类型日期
+ (NSString *)formatStringDataWithString:(NSString *)date format:(NSString *)format;

//  日期转换成星期
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;

//  更改行间距
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

//  更改字间距
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

//  过滤nil
+ (NSString *)filterNilData:(NSString *)input;

//  判断数据是否为Null,nil
+ (BOOL)isNotNULL:(id)obj;

//  NSDate转为string 格式为formatter
+ (NSString *)stringDateFromDate:(NSDate *)date formatterString:(NSString *)formatter;

//  时间戳转日期
+ (NSString *)timestampChangeToDateString:(NSTimeInterval)timeValue;

//  删除json中的转义字符
+ (id)replacingJson:(NSString *)json;

+ (NSString *)calculSize:(NSInteger)size;



@end

NS_ASSUME_NONNULL_END
