//
//  SetMailController.m
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SetMailController.h"

@interface SetMailController ()

@end

@implementation SetMailController
@synthesize rightSwipeGestureRecognizer,leftSwipeGestureRecognizer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置背景图片
    UIImage *bgImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    
    
    //设置手势操作
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"mail" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];


    
    [_accout setText:[data objectForKey:@"accout"]];
    [_passwd setText:[data objectForKey:@"passwd"]];
    [_smtp setText:[data objectForKey:@"smtp"]];
  
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self.navigationController popViewControllerAnimated:TRUE];      }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.navigationController popViewControllerAnimated:TRUE];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)HiddenKey:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
- (IBAction)submit:(id)sender {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"mail" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
      [data setObject:_passwd.text forKey:@"passwd"];
      [data setObject:_accout.text forKey:@"accout"];
      [data setObject:_smtp.text forKey:@"smtp"];
    
    
BOOL flag=[data writeToFile:plistPath atomically:NO]; 
    
    
}
- (void)dealloc {
    [_accout release];
    [_passwd release];
    [_smtp release];
    [super dealloc];
}
@end
