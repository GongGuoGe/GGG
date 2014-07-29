//
//  BestViewController.h
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface BestViewController : ViewController
@property (retain, nonatomic) IBOutlet UITextView *bestText;
@property (retain, nonatomic) IBOutlet UITextView *bedText;
@property (retain, nonatomic) IBOutlet UITextView *wantText;
- (IBAction)AddBest:(id)sender;

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
- (IBAction)hiden:(id)sender;
- (IBAction)onBack:(id)sender;
@end
