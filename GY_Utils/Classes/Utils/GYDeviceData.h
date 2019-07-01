//
//  GYDeviceData.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/6.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYDeviceData : NSObject

+ (GYDeviceData *)instance;

//  设备型号  iPhone_6S
- (const NSString *)getDiviceName;

//  设备初始系统型号
- (const NSString *)getInitialVersion;

//  设备支持的最高系统型号
- (const NSString *)getLatestVersion;

//  设备电池容量，单位 mA 毫安
- (NSInteger)getBatteryCapacity;

//  电池电压，单位 V 福特
- (CGFloat)getBatterVolocity;

//  CPU处理器名称
- (const NSString *)getCPUProcessor;




@end

NS_ASSUME_NONNULL_END
