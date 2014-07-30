//
//  UINavC.m
//  功过格
//
//  Created by Ray M on 14-7-30.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "UINavC.h"
#import "TodayViewController.h"


@interface UINavC ()

@end

@implementation UINavC

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSUInteger)supportedInterfaceOrientations{
    if([[self topViewController] isKindOfClass:[TodayViewController class]])
        return UIInterfaceOrientationMaskLandscapeRight;
    else
        return UIInterfaceOrientationMaskPortrait;
}


- (BOOL)shouldAutorotate
{
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
