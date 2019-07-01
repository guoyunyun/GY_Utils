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

//  邮箱的有效性
- (BOOL)isEmailAddress;
/** 判断是否为纯数字 */
- (BOOL)isPureDigital;
// 是否纯汉字
- (BOOL)isValidChinese;
//  是否为纯字母
- (BOOL)isPureLetters;
//  是否包含字母
- (BOOL)isContainLetters;
/** 判断6~18位字母开头，只能包含“字母”，“数字”，“下划线”：位数可更改 */
- (BOOL)isValidPassword;
/** 判断是否为大写字母 */
- (BOOL)isCapitalLetters;
/** 判断是否为小写字母 */
- (BOOL)isLowercaseLetters;
/** 判断是否以字母开头 */
- (BOOL)isLettersBegin;
/** 判断是否以汉字开头 */
- (BOOL)isChineseBegin;
/** 验证手机号 严谨:运营商号段 */
- (BOOL)isPhoneNumber;
/** 验证邮箱 */
- (BOOL)isValidateEmail;
/** 简单验证身份证 */
- (BOOL)simpleVerifyIdentityCard;
/** 精确验证18位身份证 */
- (BOOL)validationCardNumberFor18;
/** 验证车型 */
- (BOOL)validateCarType;
/** 车牌号的有效性验证 */
- (BOOL)isLicensePlate;
/** IP地址有效性 */
- (BOOL)isIPAddress;
/** MAC地址有效性 */
- (BOOL)isMacAddress;
/** 邮编有效性 */
- (BOOL)isValidPostalcode;
/** 验证银行卡号有效性 */
- (BOOL)isBankCardNumber;

/** 判断是否开启了定位 */
- (BOOL)isOpenLocationService;





//  版本号比较
- (GYVersionModel)compareVersiononlineVersion:(NSString *)version;





@end

NS_ASSUME_NONNULL_END
