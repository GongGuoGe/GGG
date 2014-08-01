//
//  SetMailController.h
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetMailController : UIViewController<UITextFieldDelegate>
{
    float oldY;
    float kbHeight;
}

@property (assign, nonatomic) IBOutlet UITextField *accout;
@property (assign, nonatomic) IBOutlet UITextField *passwd;
@property (assign, nonatomic) IBOutlet UITextField *smtp;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
- (IBAction)submit:(id)sender;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
- (IBAction)HiddenKey:(id)sender;
@end
