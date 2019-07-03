//
//  GYKeyChain.h
//  DripCarBuy
//
//  Created by shuidi_iMac on 2018/12/12.
//  Copyright © 2018 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYKeyChain : NSObject

//  添加数据到系统KeyChain
+(BOOL)addValue:(NSString*)value withKey:(NSString*)key;

//  更新系统KeyChain数据
+(BOOL)updateValue:(NSString*)value withKey:(NSString*)key;

//  删除系统KeyChain数据
+(BOOL)delValueInKeyChain:(NSString*)key;
//+(BOOL)delKeyChain:(NSString*)key;
//  查询系统KeyChain数据
+(NSString*)getValueWithKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
