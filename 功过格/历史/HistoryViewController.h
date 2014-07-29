//
//  HistoryViewController.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"
#import "VRGCalendarView.h"
@interface HistoryViewController : ViewController
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (strong, nonatomic) NSString *param;
@end
