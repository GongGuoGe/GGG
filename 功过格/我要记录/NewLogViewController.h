//
//  NewLogViewController.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ViewController.h"

@interface NewLogViewController : ViewController<UITextViewDelegate>
{
    float oldY;
    float kbHeight;
}
@property (strong, nonatomic) NSString *paramname;
@property (assign) int param;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (assign, nonatomic) IBOutlet UITextView *wrongtext;

@property (assign, nonatomic) IBOutlet UITextView *willtext;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;

- (IBAction)submit:(id)sender;
@property (assign, nonatomic) IBOutlet UITextView *righttext;
- (IBAction)hiden:(id)sender;

@end
