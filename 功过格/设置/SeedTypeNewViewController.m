//
//  SeedTypeNewViewController.m
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SeedTypeNewViewController.h"
#import "SeedSQLService.h"
@interface SeedTypeNewViewController ()

@end

@implementation SeedTypeNewViewController
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
        [self performSegueWithIdentifier:@"seedseetNewToList" sender:self];      }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"seedseetNewToList" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SeedTypeAdd:(id)sender {
    SeedSQLService   *sqlSer = [[SeedSQLService alloc] init];
    sqlSeedList *sqlInsert = [[sqlSeedList alloc]init];
    sqlInsert.seedName = _seedName.text; 
    
    //调用封装好的数据库插入函数
    if ([sqlSer insertTestList:sqlInsert]) {
        [self performSegueWithIdentifier:@"seedseetNewToList" sender:self];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"插入数据失败"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
    [self performSegueWithIdentifier:@"seedseetNewToList" sender:self];
    
}
- (void)dealloc {
    [_seedName release];
    [super dealloc];
}
- (IBAction)HiddenKey:(id)sender {
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]; 
}
@end
