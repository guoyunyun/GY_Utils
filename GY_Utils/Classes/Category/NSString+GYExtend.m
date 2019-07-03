//
//  NSString+GYExtend.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/5/21.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "NSString+GYExtend.h"

@implementation NSString (GYExtend)

//邮箱
- (BOOL)isEmailAddress{
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}

#pragma mark - 正则相关
- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

//纯汉字
- (BOOL)isValidChinese;
{
    NSString *chineseRegex = @"^[\u4e00-\u9fa5]+$";
    return [self isValidateByRegex:chineseRegex];
}

/**
 * 版本号比较
 * @prama version1 版本号信息1
 * @prama version2 版本号信息2
 * @reutrn 返回较大的版本号信息
 */
- (GYVersionModel)compareVersiononlineVersion:(NSString *)version{
    
    // 获取各个版本号对应版本信息
    NSMutableArray *versionStep1 = [NSMutableArray arrayWithArray:[self componentsSeparatedByString:@"."]];
    NSMutableArray *versionStep2 = [NSMutableArray arrayWithArray:[version componentsSeparatedByString:@"."]];
    
    // 补全版本信息为相同位数
    while (versionStep1.count < versionStep2.count) {
        [versionStep1 addObject:@"0"];
    }
    while (versionStep2.count < versionStep1.count) {
        [versionStep2 addObject:@"0"];
    }
    
    // 遍历每一个版本信息中的位数
    // 记录比较结果值
    GYVersionModel mode = 0;
    for(NSUInteger i = 0; i < versionStep1.count; i++){
        NSInteger versionNumber1 = [versionStep1[i] integerValue];
        NSInteger versionNumber2 = [versionStep2[i] integerValue];
        if (versionNumber1 < versionNumber2) {
            mode = GYVersionModelSmall;
            break;
        }
        else if (versionNumber2 < versionNumber1){
            mode = GYVersionModelBig;
            break;
        }else if (versionNumber1 == versionNumber2){
            mode = GYVersionModelEqual;
        }else{
            mode = GYVersionModelNone;
        }
    }
    
    return mode;
}




@end
