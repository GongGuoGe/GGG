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
@property (strong, nonatomic) NSString *paramnum;
@property (retain, nonatomic) IBOutlet UITextField *counttype;
@property (retain, nonatomic) IBOutlet UITextField *countnum;
@property (strong, nonatomic) NSString *param;
- (IBAction)del:(id)sender;

- (IBAction)hiden:(id)sender;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
- (IBAction)update:(id)sender;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
- (IBAction)textFiledReturnEditing:(id)sender;
@end
