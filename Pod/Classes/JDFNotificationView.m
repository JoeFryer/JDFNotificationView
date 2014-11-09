//
//  JDFNotificationView.m
//  JDFNotificationView
//
//  Created by Joe Fryer on 09/11/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "JDFNotificationView.h"

// Geometry
static CGFloat const JDFNotificationViewDefaultHeight = 80.0f;
static CGFloat const JDFNotificationViewTitleLabelHeight = 25.0f;
static CGFloat const JDFNotificationViewTitleLabelSidePadding = 10.0f;

// Timings
static NSTimeInterval const JDFNotificationViewDefaultDisplayTime = 1.0f;
static NSTimeInterval const JDFNotificationViewDefaultAnimationDuration = 0.5f;



@interface JDFNotificationView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@end



@implementation JDFNotificationView

#pragma mark - Getters

- (UIColor *)titleLabelTextColor
{
    if (!_titleLabelTextColor) {
        _titleLabelTextColor = [UIColor whiteColor];
    }
    return _titleLabelTextColor;
}

- (UIColor *)subtitleLabelTextColor
{
    if (!_subtitleLabelTextColor) {
        _subtitleLabelTextColor = [UIColor whiteColor];
    }
    return _subtitleLabelTextColor;
}

- (UIFont *)titleLabelFont
{
    if (!_titleLabelFont) {
        _titleLabelFont = [UIFont systemFontOfSize:20.0f];
    }
    return _titleLabelFont;
}

- (UIFont *)subtitleLabelFont
{
    if (!_subtitleLabelFont) {
        _subtitleLabelFont = [UIFont systemFontOfSize:12.0f];
    }
    return _subtitleLabelFont;
}

- (NSTimeInterval)displayTime
{
    if (_displayTime < 0.0) {
        return JDFNotificationViewDefaultDisplayTime;
    }
    return _displayTime;
}

- (NSTimeInterval)animationDuration
{
    if (_animationDuration < 0.0) {
        return JDFNotificationViewDefaultAnimationDuration;
    }
    return _animationDuration;
}

- (CGFloat)height
{
    if (_height < 0.0f) {
        return JDFNotificationViewDefaultHeight;
    }
    return _height;
}


#pragma mark - Setters

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setSubtitle:(NSString *)subtitle
{
    _subtitle = subtitle;
    self.subtitleLabel.text = subtitle;
}


#pragma mark - Init

- (instancetype)initWithTitle:(NSString *)title colour:(UIColor *)colour
{
    self = [super init];
    if (self) {
        self.title = title;
        self.backgroundColor = colour;
        [self commonInit];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    // Options
    self.displayTime = -1.0f;
    self.animationDuration = -1.0f;
    self.height = -1.0f;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = self.titleLabelTextColor;
    self.titleLabel.font = self.titleLabelFont;
    self.titleLabel.text = self.title;
    [self addSubview:self.titleLabel];
    
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    self.subtitleLabel.textColor = self.subtitleLabelTextColor;
    self.subtitleLabel.font = self.subtitleLabelFont;
    self.subtitleLabel.text = self.subtitle;
    [self addSubview:self.subtitleLabel];
}


#pragma mark - Showing the notification view

- (void)showFromBottomOfView:(UIView *)view
{
    [self showFromBottomOfView:view withBottomGap:0.0f];
}

- (void)showFromBottomOfView:(UIView *)view withBottomGap:(CGFloat)gap
{
    [self showFromBottomOfView:view withBottomGap:gap completion:nil];
}

- (void)showFromBottomOfView:(UIView *)view completion:(void (^)())completion
{
    [self showFromBottomOfView:view withBottomGap:0.0f completion:completion];
}

- (void)showFromBottomOfView:(UIView *)view withBottomGap:(CGFloat)gap completion:(void (^)())completion
{
    [view addSubview:self];
    
    CGRect hiddenFrame = CGRectMake(0.0f, view.frame.size.height, view.frame.size.width, self.height);
    self.frame = hiddenFrame;
    
    CGFloat width = self.frame.size.width - (JDFNotificationViewTitleLabelSidePadding * 2);
    CGFloat titleLabelY = self.subtitle.length > 0 ? (self.frame.size.height / 2) - (JDFNotificationViewTitleLabelHeight) : (self.frame.size.height / 2) - (JDFNotificationViewTitleLabelHeight / 2);
    self.titleLabel.frame = CGRectMake(JDFNotificationViewTitleLabelSidePadding, titleLabelY, width, JDFNotificationViewTitleLabelHeight);
    self.subtitleLabel.frame = CGRectMake(JDFNotificationViewTitleLabelSidePadding, CGRectGetMaxY(self.titleLabel.frame), width, JDFNotificationViewTitleLabelHeight);
    self.titleLabel.font = self.titleLabelFont;
    self.titleLabel.textColor = self.titleLabelTextColor;
    self.subtitleLabel.font = self.subtitleLabelFont;
    self.subtitleLabel.textColor = self.subtitleLabelTextColor;
    
    [UIView animateWithDuration:self.animationDuration delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(self.frame.origin.x, view.frame.size.height - self.frame.size.height - gap, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:self.animationDuration delay:self.displayTime options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frame = hiddenFrame;
        } completion:^(BOOL finishedAgain) {
            [self removeFromSuperview];
            if (completion) {
                completion();
            }
        }];
    }];
}

@end
