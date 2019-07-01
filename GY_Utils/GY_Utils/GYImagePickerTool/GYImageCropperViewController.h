//
//  GYImageCropperViewController.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/3/5.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^submitBlock)(UIViewController *viewController , UIImage *image);
typedef void(^cancelBlock)(UIViewController *viewController);

@interface GYImageCropperViewController : UIViewController

@property (nonatomic, assign) CGRect cropFrame;
@property (nonatomic, copy) submitBlock submitblock;
@property (nonatomic, copy) cancelBlock cancelblock;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end

NS_ASSUME_NONNULL_END
