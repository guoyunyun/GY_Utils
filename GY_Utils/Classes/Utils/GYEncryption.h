//
//  GYEncryption.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

void *MMBase64Decode(
                     const char *inputBuffer,
                     size_t length,
                     size_t *outputLength);

char *MMBase64Encode(
                     const void *inputBuffer,
                     size_t length,
                     bool separateLines,
                     size_t *outputLength);


@interface GYEncryption : NSObject

#pragma mark base64

+ (NSData *)decodeFromData:(NSData*) data;
+ (NSData *)decodeFromString:(NSString *)aString;

+ (NSString *)encodeWithString:(NSString*) aString;
+ (NSString *)encodeWithData:(NSData*) data;
// added by Hiroshi Hashiguchi
+ (NSString *)encodeWithSeparateLines:(NSData*) data lines:(BOOL)separateLines;

#pragma mark md5

//  32位小写
+ (nullable NSString *)md5StringWithString:(NSString *)string;

//  32位大写
+ (nullable NSString *)MD5StringWithString:(NSString *)string;

#pragma mark des

//加密
+ (NSString *) encryptUseDES2:(NSString *)plainText key:(NSString *)key;

//解密
+ (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;





@end

NS_ASSUME_NONNULL_END
