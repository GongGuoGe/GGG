//
//  CountAddViewController.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>    
@interface CountAddViewController : ViewController

@property (strong, nonatomic) IBOutlet UITextField *countName;
- (IBAction)HiddenKey:(id)sender;
 
@property (strong, nonatomic) IBOutlet UITextField *countNum;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)Add:(id)sender; 

@end
