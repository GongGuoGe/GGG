//
//  CountViewController.h
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface CountViewController : ViewController

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (retain, nonatomic) IBOutlet UITapGestureRecognizer *Taped;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (strong, nonatomic) NSString *paramtype;
@property (strong, nonatomic) NSString *paramnum;
@property (retain, nonatomic) IBOutlet UILabel *num;
@property (strong, nonatomic) NSString *param;
- (IBAction)click:(id)sender;
@end
