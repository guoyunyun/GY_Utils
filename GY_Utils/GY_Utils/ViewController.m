//
//  ViewController.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "ViewController.h"
#import "GYAPPInfo.h"
#import "GYFuncUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *appVerion = [GYAPPInfo instance].appVerion;
    NSString *deviceName = [GYAPPInfo instance].deviceName;
    NSString *systemVersion = [GYAPPInfo instance].systemVersion;
    NSString *vendorID = [GYAPPInfo instance].vendorID;
    
    NSString *carrierName = [GYAPPInfo instance].carrierName;
    NSString *screenInfo = [GYAPPInfo instance].screenInfo;
    NSString *netWorkType = [GYAPPInfo instance].netWorkType;
    NSString *CPUType = [GYAPPInfo instance].CPUType;
    
    
    NSLog(@"应用版本号 appVerion %@",appVerion);
    NSLog(@"设备名称 deviceName %@",deviceName);
    NSLog(@"系统版本号 systemVersion %@",systemVersion);
    NSLog(@"设备唯一ID vendorID %@",vendorID);
    NSLog(@"运营商 carrierName %@",carrierName);
    
    NSLog(@"屏幕分辨率 screenInfo %@",screenInfo);
    NSLog(@"网络类型 netWorkType %@",netWorkType);
    NSLog(@"架构信息 CPUType %@",CPUType);
    
    
    
    BOOL canMakePhoneCall = [GYAPPInfo instance].canMakePhoneCall;
    NSString *createGUID = [[GYAPPInfo instance] createGUID];
    CGFloat getMachAbsoluteTime = [GYAPPInfo getMachAbsoluteTime];
    NSString *getMacAddress = [[GYAPPInfo instance] getMacAddress];
    
    
    NSLog(@"能否打电话 canMakePhoneCall %d",canMakePhoneCall);
    NSLog(@"获取机器时间 getMachAbsoluteTime %f",getMachAbsoluteTime);
    NSLog(@"mac地址 getMacAddress %@",getMacAddress);
    
    
    NSString *getAppBuild = [[GYAPPInfo instance] getAppBuild];
    NSLog(@"getAppBuild %@",getAppBuild);
    
    NSString *getBundleName = [[GYAPPInfo instance] getBundleName];
    NSLog(@"getBundleName %@",getBundleName);
    
    
    
    [GYFuncUtils filterNilData:@"111"];
}


@end
