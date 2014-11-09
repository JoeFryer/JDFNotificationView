//
//  JDFNotificationView.h
//  JDFNotificationView
//
//  Created by Joe Fryer on 09/11/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 JDFNotificationView is a simple UIView subclass that makes it easy to show simple notifications to the user without getting in their way.
 
 To use, simply create an instance, setup any options, and call one of the `show` methods, supplying the view you want it to be shown from. The notification will automatically dismiss itself after a certain amount of time.
 */
@interface JDFNotificationView : UIView

/// ==========================================
///  Notification text
/// ==========================================

/** The title label text */
@property (nonatomic, copy) NSString *title;

/** The subtitle label text */
@property (nonatomic, copy) NSString *subtitle;


/// ==========================================
///  Options
/// ==========================================

/** The title label text colour */
@property (nonatomic, strong) UIColor *titleLabelTextColor;

/** The subtitle label text colour */
@property (nonatomic, strong) UIColor *subtitleLabelTextColor;

/** The title label font */
@property (nonatomic, strong) UIFont *titleLabelFont;

/** The subtitle label font */
@property (nonatomic, strong) UIFont *subtitleLabelFont;

/** The amount of time the notification will display for before dismissing itself, in seconds */
@property (nonatomic) NSTimeInterval displayTime;

/** The amount of time the show/hide animations take, in seconds */
@property (nonatomic) NSTimeInterval animationDuration;

/** The height of the notification view */
@property (nonatomic) CGFloat height;


/// ==========================================
///  Initialisers
/// ==========================================

/** Convenience initialiser, with a title and colour (the colour is equivalent to the view's backgroundColor). */
- (instancetype)initWithTitle:(NSString *)title colour:(UIColor *)colour;


/// ==========================================
///  Showing the notification
/// ==========================================

/** Shows the notification from the bottom of the specified view */
- (void)showFromBottomOfView:(UIView *)view;

/** Shows the notification from the bottom of the specified view, with a gap between the view and the notification */
- (void)showFromBottomOfView:(UIView *)view withBottomGap:(CGFloat)gap;

/** Shows the notification from the bottom of the specified view, with a completion block (executed after the notification is dismissed) */
- (void)showFromBottomOfView:(UIView *)view completion:(void(^)())completion;

/** Shows the notification from the bottom of the specified view, with a gap, and with a completion block (executed after the notification is dismissed) */
- (void)showFromBottomOfView:(UIView *)view withBottomGap:(CGFloat)gap completion:(void(^)())completion;

@end
