//
//  JDFViewController.m
//  JDFNotificationView
//
//  Created by Joe Fryer on 11/08/2014.
//  Copyright (c) 2014 Joe Fryer. All rights reserved.
//

#import "JDFViewController.h"
#import "JDFNotificationView.h"


@interface JDFViewController ()

@end


@implementation JDFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    CGFloat buttonWidth = 100.0f;
    button.frame = CGRectMake((self.view.frame.size.width / 2) - (buttonWidth / 2), self.view.frame.size.height * 0.4, buttonWidth, 30.0f);
    [button setTitle:@"Press Me!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonPressed:(UIButton *)sender
{
    JDFNotificationView *notificationView = [[JDFNotificationView alloc] initWithTitle:@"Something kinda interesting happened." colour:[UIColor colorWithRed:98.0f/255.0f green:155.0f/255.0f blue:221.0f/255.0f alpha:1.0f]];
    notificationView.subtitle = @"And I'm telling you about it!";
    notificationView.titleLabelFont = [UIFont fontWithName:@"Avenir" size:16.0f];
    notificationView.subtitleLabelFont = [UIFont fontWithName:@"Avenir" size:10.0f];
    [notificationView showFromBottomOfView:self.view];
}

@end
