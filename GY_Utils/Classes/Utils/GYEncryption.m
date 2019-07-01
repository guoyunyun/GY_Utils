//
//  GYEncryption.m
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import "GYEncryption.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Security/Security.h>

@implementation GYEncryption



#pragma mark -- DES
//
////  加密
//+ (NSString *)DESEncry:(NSString *)string key:(NSString *)key{
//
//    return [self encryptUseDES:string key:key];
//}
////  解密
//+ (NSString *)DESDecry:(NSString *)string key:(NSString *)key{
//
//    return [self decryptUseDES:string key:key];
//}
//
///*字符串加密
// *参数
// *plainText : 加密明文
// *key       : 密钥 64位
// */
//+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key {
//
//    NSString *ciphertext = nil;
//    const char *textBytes = [plainText UTF8String];
//    NSUInteger dataLength = [plainText length];
//    unsigned char buffer[1024];
//    memset(buffer, 0, sizeof(char));
//    Byte iv[] = { 0x12, 0x34, 0x56, 0x78,  0x90,  0xAB,  0xCD,  0xEF };
//    size_t numBytesEncrypted = 0;
//    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding,
//                                          [key UTF8String], kCCKeySizeDES,
//                                          iv,
//                                          textBytes, dataLength,
//                                          buffer, 1024,
//                                          &numBytesEncrypted);
//    if (cryptStatus == kCCSuccess) {
//        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
//
//        ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
//    }
//    return ciphertext;
//}
//
////解密
//+ (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key {
//
//    NSData* cipherData = [GTMBase64 decodeString:cipherText];
//    unsigned char buffer[1024];
//    memset(buffer, 0, sizeof(char));
//    size_t numBytesDecrypted = 0;
//    Byte iv[] = { 0x12, 0x34, 0x56, 0x78,  0x90,  0xAB,  0xCD,  0xEF };
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
//                                          kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding,
//                                          [key UTF8String],
//                                          kCCKeySizeDES,
//                                          iv,
//                                          [cipherData bytes],
//                                          [cipherData length],
//                                          buffer,
//                                          1024,
//                                          &numBytesDecrypted);
//    NSString* plainText = nil;
//    if (cryptStatus == kCCSuccess) {
//        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
//        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    }
//    return plainText;
//}



#pragma mark -- MD5

+ (nullable NSString *)md5StringWithString:(NSString *)string{
    
    //32位小写
    const char *str = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( str, (CC_LONG)string.length, digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

+ (nullable NSString *)MD5StringWithString:(NSString *)string;{
    
    //32位大写
    const char *str = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( str, (CC_LONG)string.length, digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return [result uppercaseString];
}


@end
