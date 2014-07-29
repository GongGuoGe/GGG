//
//  SetMainViewController.m
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SetMainViewController.h"

@interface SetMainViewController ()

@end

@implementation SetMainViewController
@synthesize rightSwipeGestureRecognizer;
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
    
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    UIBarButtonItem *btnHome = [[UIBarButtonItem alloc]
                                initWithTitle:@"主页"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(onHome:)];
    
    self.navigationItem.rightBarButtonItem = btnHome;
}





- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.navigationController popViewControllerAnimated:TRUE];        
    }
    
}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"ddddjump");
//    [self performSegueWithIdentifier:@"jump1" sender:self];
//    
//    [UIView commitAnimations];
//    
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)onHome:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

@end
