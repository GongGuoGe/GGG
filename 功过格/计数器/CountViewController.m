//
//  CountViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "CountViewController.h"
#import "CountSqlService.h"
@interface CountViewController ()

@end

@implementation CountViewController
@synthesize param;
@synthesize paramtype;
@synthesize paramnum;
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
    
    [_num setText:[NSString stringWithFormat:@"%d", paramnum]];
    
    // 设置背景图片
        
    //设置手势操作
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];



   	UITapGestureRecognizer *oneFingerTwoTaps =     [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] autorelease];
   
    // Set required taps and number of touches
   
    [oneFingerTwoTaps setNumberOfTapsRequired:1];
 
    [oneFingerTwoTaps setNumberOfTouchesRequired:1];
  
  
    [[self view] addGestureRecognizer:oneFingerTwoTaps];


}


-(void)oneFingerTwoTaps
{
    int tmp=[_num.text intValue];
    
    
    tmp=tmp+1;
    
    
    CountSqlService   *sqlSer = [[CountSqlService alloc] init];
    [_num setText:[NSString stringWithFormat:@"%d",tmp]];
    sqlCountList *sqlInsert = [[sqlCountList alloc]init];
    sqlInsert.countNum = tmp;
    sqlInsert.countType = paramtype;
    sqlInsert.sqlid    = param;
    [sqlSer updateTestList:sqlInsert];
    [sqlInsert release];
    [sqlSer release];
}  

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self.navigationController popViewControllerAnimated:TRUE];
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.navigationController popViewControllerAnimated:TRUE];
    }
}


- (IBAction)click:(id)sender {
    
}

- (void)dealloc {
    [super dealloc];
}
@end
