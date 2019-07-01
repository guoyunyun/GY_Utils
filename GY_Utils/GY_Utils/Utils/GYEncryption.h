//
//  GYEncryption.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYEncryption : NSObject

#pragma mark -- DES

//  加密
+ (NSString *)DESEncry:(NSString *)string key:(NSString *)key;
//  解密
+ (NSString *)DESDecry:(NSString *)string key:(NSString *)key;


#pragma mark -- MD5

//  32位小写
+ (nullable NSString *)md5StringWithString:(NSString *)string;
//  32位大写
+ (nullable NSString *)MD5StringWithString:(NSString *)string;






@end

NS_ASSUME_NONNULL_END
