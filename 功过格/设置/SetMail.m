//
//  SetMail.m
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SetMail.h"

@interface SetMail ()

@end

@implementation SetMail
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
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self performSegueWithIdentifier:@"SetMailBack" sender:self];
        
        
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"SetMailBack" sender:self];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
