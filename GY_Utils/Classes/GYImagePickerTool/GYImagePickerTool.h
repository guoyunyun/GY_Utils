//
//  GYImagePickerTool.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,GYImagePickerSourceType){
    
    GYImagePickerSourceTypeCamera = 0,
    GYImagePickerSourceTypePhotoLibrary = 1,
};


@interface GYImagePickerTool : NSObject


+ (instancetype) sharedInstance;

//取消选取
@property (nonatomic, copy) void (^cancelBlock)();

//成功选取图片
@property (nonatomic, copy) void (^chooseImageBlock)(UIImage *image);


//Custom cut. Cutting box's scale(height/Width) 0~1.5 default is 1
- (void)showImagePickerWithPresentController:(UIViewController *)viewController
                                  sourceType:(GYImagePickerSourceType)sourceType
                                       Scale:(double)scale;

//普通剪裁  1：1
- (void)showImagePickerWithPresentController:(UIViewController *)viewController
                          OriginalSourceType:(GYImagePickerSourceType)sourceType;


@end

NS_ASSUME_NONNULL_END
