//
//  GYTabBar.m
//  MCTabBarController
//
//  Created by shuidi_iMac on 2019/3/15.
//  Copyright © 2019 caohouhong. All rights reserved.
//

#import "GYTabBar.h"

static CGFloat const GYTabBarItemHeight = 49.0f;

@implementation GYTabBar

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self initView];
    }
    return self;
}

- (void)initView{
    
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.centerButton.adjustsImageWhenHighlighted = NO;
    [self addSubview:self.centerButton];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    switch (self.buttonPoint) {
        case GYTabBarCenterButtonPointCenter:{
            
            self.centerButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-_centerWidth)/2, (GYTabBarItemHeight-_centerHeight)/2 + self.centerOffsetY, _centerWidth, _centerHeight);
            }
            break;
            
        case GYTabBarCenterButtonPointBulge:{
            
            self.centerButton.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - _centerWidth)/2, -_centerHeight/2 + self.centerOffsetY , _centerWidth, _centerHeight);
            }
            break;
        default:
            break;
    }
}

- (void)setSelectImage:(UIImage *)selectImage{
    
    _selectImage = selectImage;
    
    [self.centerButton setBackgroundImage:selectImage forState:UIControlStateSelected];
}

- (void)setNoramalImage:(UIImage *)noramalImage{
    
    _noramalImage = noramalImage;
    
    if (_centerWidth <= 0 || _centerHeight <=0) {
        _centerWidth = noramalImage.size.width;
        _centerHeight = noramalImage.size.height;
    }
    [self.centerButton setBackgroundImage:noramalImage forState:UIControlStateNormal];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if (self.hidden) {
        return [super hitTest:point withEvent:event];
    }else{
        
        CGPoint hitPoint = [self.centerButton convertPoint:point fromView:self];
        
        if (CGRectContainsPoint(self.centerButton.bounds, hitPoint)) {
            
            return self.centerButton;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
}
    
    
    




@end
