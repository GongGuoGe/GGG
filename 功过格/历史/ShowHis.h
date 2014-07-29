//
//  ShowHis.h
//  功过格
//
//  Created by davia on 14-2-18.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface ShowHis : ViewController
@property (retain, nonatomic) IBOutlet UITextView *rightttext;
@property (retain, nonatomic) IBOutlet UITextView *wrongtext;
@property (retain, nonatomic) IBOutlet UITextView *willtext;
@property (retain, nonatomic) IBOutlet UILabel *seedname;

@property (retain, nonatomic) IBOutlet UILabel *addtime;


@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;

@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (strong, nonatomic) NSString *param;
@property (strong, nonatomic) NSString *param2;
@property (strong, nonatomic) NSString *right;
@property (strong, nonatomic) NSString *wrong;
@property (strong, nonatomic) NSString *will;
@property (strong, nonatomic) NSString *addtimevalue;
@property (strong, nonatomic) NSString *seddnamevalue;
- (IBAction)hiden:(id)sender;
@end
