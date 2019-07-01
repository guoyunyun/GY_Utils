//
//  GYKeyChain.m
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import "GYKeyChain.h"
#import <Security/Security.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

/**
 * 特别申明：
 * kKeyChainItemIdentifier 是为取vendorID使用的一个key(同一个开发商不同应用用同一key)
 * 理论上所有同一个开发商（证书）所有应用获取vendorID都应用一样
 *      但实际上iOS sdk存在一此bug，获取vendorID有可能不同
 *
 */
static NSString* kKeyChainItemIdentifier  = @"com.minutes.dripCarBuy";

@implementation GYKeyChain


//添加数据到系统KeyChain
+(BOOL)addValue:(NSString*)value withKey:(NSString*)key
{
    return [self createKeychainValue:value forIdentifier:key];
}

//更新系统KeyChain数据
+(BOOL)updateValue:(NSString*)value withKey:(NSString*)key
{
    return [self updateKeychainValue:value forIdentifier:key];
}

//删除系统KeyChain数据
//+(BOOL)delKeyChain:(NSString*)key
//{
//
//}
+(BOOL)delValueInKeyChain:(NSString*)key
{
    return [self deleteKeychainValue:key];
}

+(NSString*)getValueWithKey:(NSString*)key
{
    NSData *data = [self searchKeychainCopyMatching:key];
    if (data) {
        NSString *value = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"scuess read value from keychain");
        return value;
    }
    NSLog(@"value in keychain is nil");
    return nil;
}

#pragma mark -
#pragma mark Helper Method for make identityForVendor consistency

+ (NSMutableDictionary *)newSearchDictionary:(NSString *)identifier
{
    NSMutableDictionary *searchDictionary = [NSMutableDictionary dictionary];
    
    [searchDictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrGeneric];
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrAccount];
    [searchDictionary setObject:kKeyChainItemIdentifier forKey:(__bridge id)kSecAttrService];
    
    return searchDictionary;
}

+ (NSData *)searchKeychainCopyMatching:(NSString *)identifier
{
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    
    // Add search attributes
    [searchDictionary setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    
    // Add search return types
    [searchDictionary setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    
    CFDataRef result = nil;
    SecItemCopyMatching((__bridge CFDictionaryRef)searchDictionary,
                        (CFTypeRef *)&result);
    NSData *data = ((__bridge_transfer NSData *)result);
    
    return data;
}

+ (BOOL)createKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier
{
    NSMutableDictionary *dictionary = [self newSearchDictionary:identifier];
    
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
    [dictionary setObject:data forKey:(__bridge id)kSecValueData];
    
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)dictionary, NULL);
    
    NSLog(@"begin add value to keychain");
    if (status == errSecSuccess) {
        NSLog(@"sucess add value to keychain");
        return YES;
    }
    NSLog(@"failed add value to keychain");
    return NO;
}

+ (BOOL)updateKeychainValue:(NSString *)password forIdentifier:(NSString *)identifier
{
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    NSMutableDictionary *updateDictionary = [[NSMutableDictionary alloc] init];
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    [updateDictionary setObject:passwordData forKey:(__bridge id)kSecValueData];
    
    OSStatus status = SecItemUpdate((__bridge CFDictionaryRef)searchDictionary,
                                    (__bridge CFDictionaryRef)updateDictionary);
    
    
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}

+ (BOOL)deleteKeychainValue:(NSString *)identifier
{
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)searchDictionary);
    
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}



@end
