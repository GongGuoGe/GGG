//
//  SeedTypeNewViewController.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface SeedTypeNewViewController : ViewController
- (IBAction)SeedTypeAdd:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *seedName;

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@end
