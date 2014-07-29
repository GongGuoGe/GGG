//
//  SeedEditDelViewController.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface SeedEditDelViewController : ViewController
@property (retain, nonatomic) IBOutlet UITextField *seedName;

@property (strong, nonatomic) NSString *paramname; 
@property (strong, nonatomic) NSString *param;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
- (IBAction)hiden:(id)sender;
- (IBAction)btnUpdate:(id)sender;
- (IBAction)btnDel:(id)sender;

@end
