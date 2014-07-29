//
//  BestViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "BestViewController.h"
#import <QuartzCore/QuartzCore.h> 
#import "RecordSQLService.h"

@interface BestViewController ()

@end

@implementation BestViewController
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
    
    //_bestText.layer.borderColor = [UIColorgrayColor].CGColor;
    _bestText.layer.borderWidth =1.0;
    _bestText.layer.cornerRadius =5.0;
    
    _bedText.layer.borderWidth =1.0;
    _bedText.layer.cornerRadius =5.0;
    
    _wantText.layer.borderWidth =1.0;
    _wantText.layer.cornerRadius =5.0;
    
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

- (IBAction)hiden:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_bestText release];
    [_bedText release];
    [_wantText release];
    [super dealloc];
}
- (IBAction)AddBest:(id)sender {
    RecordSQLService   *sqlSer = [[RecordSQLService alloc] init];
    sqlRecordList *sqlInsert = [[sqlRecordList alloc]init];
    sqlInsert.seedName = @"最好";
    sqlInsert.righttext = _bestText.text;
   sqlInsert.wrongtext=_bedText.text;
   sqlInsert.willtext=_wantText.text;
//    
//    //调用封装好的数据库插入函数
    if ([sqlSer insertTestList:sqlInsert]) {
       [self performSegueWithIdentifier:@"bestToMain" sender:self];
   }
    else {
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                       message:@"插入数据失败"
                                                      delegate:self
                                              otherButtonTitles:nil];
        [alert show];
        
    }

}


@end
