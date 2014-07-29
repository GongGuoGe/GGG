//
//  SelectDate.h
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"
@interface SelectDate : UIViewController
@property (strong, nonatomic) NSString *paramname;
@property (assign) int param;
- (IBAction)expevent:(id)sender;
@property (retain, nonatomic) IBOutlet UIDatePicker *startdate;
@property (retain, nonatomic) IBOutlet UIButton *exportbtn;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (retain, nonatomic) IBOutlet UIDatePicker *enddate;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@end
