//
//  GYImagePickerTool.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "GYImagePickerTool.h"
#import "GYImageCropperViewController.h"
#define ScreenWidth  CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface GYImagePickerTool()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    BOOL isScale;
    double _scale;
}
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) GYImageCropperViewController *imageCropperController;
@end

@implementation GYImagePickerTool

static GYImagePickerTool *sharedInstance = nil;

+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GYImagePickerTool alloc] init];
    });
    return sharedInstance;
}

- (void)showImagePickerWithPresentController:(UIViewController *)viewController
                          OriginalSourceType:(GYImagePickerSourceType)sourceType{
    
    if (sourceType == GYImagePickerSourceTypeCamera) {
#if TARGET_IPHONE_SIMULATOR //模拟器
        NSLog(@"请使用真机测试");
        return;
#elif TARGET_OS_IPHONE //真机
        self.imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
#endif
        
    }else{
        self.imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    }
    isScale = NO;
    self.imagePickerController.allowsEditing = YES;
    [viewController presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)showImagePickerWithPresentController:(UIViewController *)viewController
                                  sourceType:(GYImagePickerSourceType)sourceType
                                       Scale:(double)scale{
    
    if ( sourceType == GYImagePickerSourceTypeCamera ) {
#if TARGET_IPHONE_SIMULATOR //模拟器
        NSLog(@"请使用真机测试");
        return;
#elif TARGET_OS_IPHONE //真机
        self.imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
#endif
    }else{
        self.imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    self.imagePickerController.allowsEditing = NO;
    
    isScale = YES;
    if(scale>0 &&scale<=1.5){
        _scale = scale;
    }else{
        _scale = 1;
    }
    
    [viewController presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageOrientation imageOrientation=image.imageOrientation;
    
    if(imageOrientation!=UIImageOrientationUp){
        // Adjust picture Angle
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    }
    
    if (isScale) {
        
        self.imageCropperController = [[GYImageCropperViewController alloc] initWithImage:image cropFrame:CGRectMake(0, (ScreenHeight-ScreenWidth*_scale)/2, ScreenWidth, ScreenWidth*_scale) limitScaleRatio:5];
        __weak typeof(self) weakself = self;
        [_imageCropperController setSubmitblock:^(UIViewController *viewController , UIImage *image) {
            [viewController dismissViewControllerAnimated:YES completion:nil];
            
            if (weakself.chooseImageBlock ) {
                weakself.chooseImageBlock(image);
            }
        }];
        
        [_imageCropperController setCancelblock:^(UIViewController *viewController){
            UIImagePickerController *picker = (UIImagePickerController *)viewController.navigationController;
            if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
                [viewController.navigationController dismissViewControllerAnimated:YES completion:nil];
            }else{
                [viewController.navigationController popViewControllerAnimated:YES];
            }
        }];
        [picker pushViewController:self.imageCropperController animated:YES];
        
    }else{
        
        NSString *imgKey = UIImagePickerControllerEditedImage;
        image=[info objectForKey:imgKey];
        
        [picker dismissViewControllerAnimated:YES completion:^{}];
        
        if (_chooseImageBlock ) {
            _chooseImageBlock(image);
        }
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    if (_cancelBlock) {
        _cancelBlock();
    }
}

#pragma mark - Getters
- (UIImagePickerController *)imagePickerController{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = NO;
    }
    return _imagePickerController;
}


@end
