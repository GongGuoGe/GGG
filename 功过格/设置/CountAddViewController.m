//
//  CountAddViewController.m
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "CountAddViewController.h"
#import "CountSqlService.h"

@interface CountAddViewController ()

@end

@implementation CountAddViewController


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
    
    UIBarButtonItem *btnHome = [[UIBarButtonItem alloc]
                                initWithTitle:NSLocalizedString(@"home", nil)
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(onHome:)];
    
    self.navigationItem.rightBarButtonItem = btnHome;
    [btnHome release];
    
    self.navigationItem.title = NSLocalizedString(@"counterNew", nil);
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)textFiledReturnEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)Add:(id)sender {
    CountSqlService   *sqlSer = [[CountSqlService alloc] init];
    sqlCountList *sqlInsert = [[sqlCountList alloc]init];
    sqlInsert.countNum = [_countNum.text intValue];
    sqlInsert.countType = _countName.text;
    
    //调用封装好的数据库插入函数
    if ([sqlSer insertTestList:sqlInsert]) {
      [self.navigationController popViewControllerAnimated:TRUE];       
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"插入数据失败"
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        
    } 

}






 
- (IBAction)HiddenKey:(id)sender {
       [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]; 
}


-(void)onHome:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

@end
