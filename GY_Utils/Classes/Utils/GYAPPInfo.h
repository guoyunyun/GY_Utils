//
//  GYAPPInfo.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/6.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYAPPInfo : NSObject

+ (GYAPPInfo *)instance;

@property (nonatomic, readonly, copy) NSString *appVerion;

@property (nonatomic, readonly, copy) NSString *deviceName;         //设备名称 "My iPhone"
@property (nonatomic, readonly, copy) NSString *deviceMode;         //设备类型 “iPhone","iPod touch"
@property (nonatomic, readonly, copy) NSString *systemVersion;      //设备系统版本号
@property (nonatomic, readonly, copy) NSString *vendorID;           //设备唯一ID identifierForVendor

@property (nonatomic, readonly, copy) NSString *carrierName;        //运营商
@property (nonatomic, readonly, copy) NSString *screenInfo;         //屏幕分辨率

@property (nonatomic, readonly, copy) NSString *netWorkType;        //网络类型
@property (nonatomic, readonly, copy) NSString *CPUType;            //架构信息

//  能否打电话
@property (nonatomic, assign, readonly) BOOL canMakePhoneCall NS_EXTENSION_UNAVAILABLE_IOS("");

//  生成GUID
- (NSString *)createGUID;
// 获取机器时间   自开机以后经过的纳秒数（10负9次方秒）
+ (uint64_t)getMachAbsoluteTime;

#pragma mark - 应用信息
//  渠道号
- (NSString *)channelId;
//  包名
- (NSString *)getBundleName;
//  build号
- (NSString *)getAppBuild;

//  获取mac地址
- (NSString *)getMacAddress;
//  获取广告标识符
//- (NSString *)getIDFA;

#pragma mark - 设备信息
//  设备型号  iPhone_6S
- (const NSString *)getDeviceName;
//  设备装机时的系统版本（最低支持版本）
- (const NSString *)getInitialFirmware;
//  设备可支持的最高系统版本
- (const NSString *)getLatestFirmware;
//  device_mode iPhone8.1
- (NSString *)getDeviceModel;

//  设备上次重启的时间
- (NSDate *)getSystemUptime;
//  CPU频率
- (NSUInteger)getCPUFrequency;
//  总线程频率
- (NSUInteger)getBusFrequency;
//  当前设备主存
- (NSUInteger)getRamSize;
//  CPU处理器名称
- (NSString *)getCPUProcessor;
//  CPU数量
- (NSUInteger)getCPUCount;
//  CPU总的使用百分比
- (float)getCPUUsage;
//  单个CPU使用百分比
- (NSArray *)getPerCPUUsage;

#pragma mark - 内存信息
//  App 所占磁盘空间
- (NSString *)getApplicationSize;
//  磁盘总空间
- (int64_t)getTotalDiskSpace;
//  未使用的磁盘空间
- (int64_t)getFreeDiskSpace;
//  已使用的磁盘空间
- (int64_t)getUsedDiskSpace;
//  总内存空间
- (int64_t)getTotalMemory;
//  活跃的内存空间
- (int64_t)getActiveMemory;
//  不活跃的内存空间
- (int64_t)getInActiveMemory;
//  空闲的内存空间
- (int64_t)getFreeMemory;
//  正在使用的内存空间
- (int64_t)getUsedMemory;
//  存放内核的内存空间
- (int64_t)getWiredMemory;
//  可释放的内存空间
- (int64_t)getPurgableMemory;

#pragma mark - 网络
//  ip
- (NSString *)getDeviceIPAddresses;
//  蜂窝地址
- (NSString *)getIpAddressWIFI;
//  WIFI IP地址
- (NSString *)getIpAddressCell;






@end

NS_ASSUME_NONNULL_END
