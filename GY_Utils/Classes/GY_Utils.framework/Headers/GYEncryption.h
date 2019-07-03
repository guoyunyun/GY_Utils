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

//  32位小写
+ (nullable NSString *)md5StringWithString:(NSString *)string;

//  32位大写
+ (nullable NSString *)MD5StringWithString:(NSString *)string;






@end

NS_ASSUME_NONNULL_END
