//
//  NSString+GYExtend.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/5/21.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "NSString+GYExtend.h"
#import <CoreLocation/CoreLocation.h>

@implementation NSString (GYExtend)


//验证正则表达式
- (BOOL)isValidateByRegex:(NSString *)regex Object:(NSString *)object {
    
    if(object.length <= 0) {
        
        return NO;
    }else {
        
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [pre evaluateWithObject:object];
    }
}

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

/** 判断是否为纯数字 */
- (BOOL)isPureDigital{
    
    NSString *regex =@"[0-9]*";
    
    return [self isValidateByRegex:regex];
}

- (BOOL)isPureLetters{
    
    NSString *regex = @"[a-zA-Z]*";
    return [self isValidateByRegex:regex];
}

- (BOOL)isContainLetters{
    
    if (!self) {return NO;}
    
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger count = [numberRegular numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    
    //count是str中包含[A-Za-z]数字的个数，只要count>0，说明str中包含数字
    if (count > 0) {return YES;}
    
    return NO;
}

/** 判断6~18位字母开头，只能包含“字母”，“数字”，“下划线”：位数可更改 */
- (BOOL)isValidPassword{
    
    NSString *regex = @"^([a-zA-Z]|[a-zA-Z0-9_]|[0-9]){6,18}$";
    return [self isValidateByRegex:regex];
}

/** 判断是否为大写字母 */
- (BOOL)isCapitalLetters{
    
    NSString *regex = @"[A-Z]*";
    
    return [self isValidateByRegex:regex];
}

/** 判断是否为小写字母 */
- (BOOL)isLowercaseLetters{
    
    NSString *regex = @"[a-z]*";
    
    return [self isValidateByRegex:regex];
}

/** 判断是否以字母开头 */
- (BOOL)isLettersBegin{
    
    if(self.length <= 0) {
        
        return NO;
        
    }else {
        
        NSString *firstStr = [self substringToIndex:1];
        
        NSString *regex = @"[a-zA-Z]*";
        
        return [self isValidateByRegex:regex Object:firstStr];
    }
}

/** 判断是否以汉字开头 */
- (BOOL)isChineseBegin{
    
    if(self.length <= 0) {
        
        return NO;
        
    }else {
        
        NSString *firstStr = [self substringToIndex:1];
        
        NSString *regex = @"[\u4e00-\u9fa5]+";
        
        return [self isValidateByRegex:regex Object:firstStr];
    }
}

/** 验证手机号 非严谨:1开头11位纯数字 */
- (BOOL)isMobileNumber{
    
    if(self.length <= 0) {
        
        return NO;
    }
    if(![[self substringToIndex:1]isEqualToString:@"1"]) {
        return NO;
    }
    
    NSString *regex =@"[0-9]*";
    
    if(![self isValidateByRegex:regex]) {
        return NO;
    }
    if(self.length != 11) {
        return NO;
    }
    return YES;
}

/** 验证手机号 严谨:运营商号段 */
- (BOOL)isPhoneNumber{
    
    if(self.length != 11) {
        
        return NO;
    }else {
        
        /**
         * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
         * 联通号段: 130,131,132,155,156,185,186,145,176,1709
         * 电信号段: 133,153,180,181,189,177,1700
         */
        
        /**
         * 手机号段正则表达式
         */
        NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
        
        return [self isValidateByRegex:MOBILE];
    }
}

/** 验证邮箱 */
- (BOOL)isValidateEmail{
    
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    return [self isValidateByRegex:regex];
}

/** 简单验证身份证 */
- (BOOL)simpleVerifyIdentityCard{
    
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [self isValidateByRegex:regex];
}


/** 精确验证18位身份证 */
- (BOOL)validationCardNumberFor18{
    
    if (self.length!=18) {
        return NO;
    }
    
    //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:self];
    
    if (!flag) {
        return flag;  //格式错误
    }else {
        //格式正确在判断是否合法
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++){
            NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            idCardWiSum+= subStrIndex * idCardWiIndex;
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2){
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]){
                return YES;
            }else{
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]){
                return YES;
            }else{
                return NO;
            }
        }
    }
}

/** 验证车型 */
- (BOOL)validateCarType{
    
    NSString *regex = @"^[\\u4E00-\\u9FFF]+$";
    
    return [self isValidateByRegex:regex];
}

/** 车牌号的有效性验证 */
- (BOOL)isLicensePlate{
    
    //车牌号:湘K-DE829 香港车牌号码:粤Z-J499港
    //其中\\u4e00-\\u9fa5表示unicode编码中汉字已编码部分，\\u9fa5-\\u9fff是保留部分，将来可能会添加
    NSString *regex = @"^[\\u4e00-\\u9fff]{1}[a-zA-Z]{1}[-][a-zA-Z_0-9]{4}[a-zA-Z_0-9_\\u4e00-\\u9fff]$";
    
    return [self isValidateByRegex:regex];
}

/** IP地址有效性 */
- (BOOL)isIPAddress{
    
    NSString *regex = [NSString stringWithFormat:@"^(\\\\d{1,3})\\\\.(\\\\d{1,3})\\\\.(\\\\d{1,3})\\\\.(\\\\d{1,3})$"];
    BOOL rc = [self isValidateByRegex:regex];
    
    if (rc) {
        
        NSArray *componds = [self componentsSeparatedByString:@","];
        
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        return v;
    }
    return NO;
}

/** MAC地址有效性 */
- (BOOL)isMacAddress{
    
    NSString *regex = @"([A-Fa-f\\\\d]{2}:){5}[A-Fa-f\\\\d]{2}";
    
    return [self isValidateByRegex:regex];
}

/** 邮编有效性 */
- (BOOL)isValidPostalcode{
    
    NSString *regex = @"^[0-8]\\\\d{5}(?!\\\\d)$";
    
    return [self isValidateByRegex:regex];
}



/** 验证银行卡号有效性 */
- (BOOL)isBankCardNumber{
    
    NSString * lastNum = [[self substringFromIndex:(self.length-1)] copy];//取出最后一位
    NSString * forwardNum = [[self substringToIndex:(self.length -1)] copy];//前15或18位
    
    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
    
    for (int i=0; i< forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i%2) {//偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        }else{//奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal =0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    NSInteger lastNumber = [lastNum integerValue];
    
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal%10 ==0)?YES:NO;
}



/** 判断是否开启了定位 */
- (BOOL)isOpenLocationService{
    
    CLAuthorizationStatus type = [CLLocationManager authorizationStatus];
    if (![CLLocationManager locationServicesEnabled] || type == kCLAuthorizationStatusDenied) {
        
        //[CLLocationManager locationServicesEnabled]是检测系统定位是否打开。
        //[CLLocationManager authorizationStatus];是检测用户是否对本应用打开定位权限。
        return NO;
    }
    
    return YES;
}




@end
