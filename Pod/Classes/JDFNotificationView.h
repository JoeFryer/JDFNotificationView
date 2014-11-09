//
//  JDFNotificationView.h
//  JDFNotificationView
//
//  Created by Joe Fryer on 09/11/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDFNotificationView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIColor *subtitleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelFont;
@property (nonatomic, strong) UIFont *subtitleLabelFont;
@property (nonatomic) NSTimeInterval displayTime;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic) CGFloat height;

- (instancetype)initWithTitle:(NSString *)title colour:(UIColor *)colour;

- (void)showFromBottomOfView:(UIView *)view;
- (void)showFromBottomOfView:(UIView *)view withBottomGap:(CGFloat)gap;
- (void)showFromBottomOfView:(UIView *)view completion:(void(^)())completion;
- (void)showFromBottomOfView:(UIView *)view withBottomGap:(CGFloat)gap completion:(void(^)())completion;

@end
