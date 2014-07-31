//
//  SeedEditDelViewController.m
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SeedEditDelViewController.h"
#import "SeedSQLService.h"
@interface SeedEditDelViewController ()

@end

@implementation SeedEditDelViewController

@synthesize param;
@synthesize paramname;
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
    
    NSLog(@"editing");
    if(param){
        [_seedName setText:paramname];

        
        
        
    }
   
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
    
    [super viewDidLoad];
    
    UIBarButtonItem *btnHome = [[UIBarButtonItem alloc]
                                initWithTitle:NSLocalizedString(@"home", nil)
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(onHome:)];
    
    self.navigationItem.rightBarButtonItem = btnHome;
    [btnHome release];

    self.navigationItem.title = NSLocalizedString(@"seedEdit", nil);
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

- (void)dealloc {
    [_seedName release];
    [super dealloc];
}

- (IBAction)btnDel:(id)sender {
    
    SeedSQLService *sqlSer = [[SeedSQLService alloc] init];
    sqlSeedList *sqlInsert = [[sqlSeedList alloc]init];
    NSLog(param);
    sqlInsert.sqlid    = [param intValue];
    
    [sqlSer deleteTestList:sqlInsert];
    [sqlSer release];
    
    [self.navigationController popViewControllerAnimated:TRUE];
    
}

 

- (IBAction)btnUpdate:(id)sender {
    SeedSQLService   *sqlSer = [[SeedSQLService alloc] init];
    sqlSeedList *sqlInsert = [[sqlSeedList alloc]init];
    sqlInsert.seedName= _seedName.text;
        sqlInsert.sqlid    = [param intValue];
    
    [sqlSer updateTestList:sqlInsert];
    
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)hiden:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

-(void)onHome:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

@end



