//
//  EditDelCount.h
//  功过格
//
//  Created by davia on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface EditDelCount : ViewController
@property (strong, nonatomic) NSString *paramtype;
@property (assign) int paramnum;
@property (assign, nonatomic) IBOutlet UITextField *counttype;
@property (assign, nonatomic) IBOutlet UITextField *countnum;
@property (assign) int param;
- (IBAction)del:(id)sender;

- (IBAction)hiden:(id)sender;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
- (IBAction)update:(id)sender;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
- (IBAction)textFiledReturnEditing:(id)sender;
@end
