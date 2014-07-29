//
//  EditDelCount.m
//  功过格
//
//  Created by davia on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "EditDelCount.h"
#import "CountSqlService.h"
@interface EditDelCount ()

@end

@implementation EditDelCount
@synthesize param;
@synthesize paramtype;
@synthesize paramnum;
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
    
       if(param){
        [_counttype setText:paramtype];
        [_countnum setText:paramnum];
        
        
        
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
    
       
    
    
    
	// Do any additional setup after loading the view.
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self performSegueWithIdentifier:@"editback" sender:self];      }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"editback" sender:self];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_counttype release];
    [_countnum release];
    [super dealloc];
}
- (IBAction)HiddenKey:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
- (IBAction)del:(id)sender {
    CountSqlService   *sqlSer = [[CountSqlService alloc] init];
    sqlCountList *sqlInsert = [[sqlCountList alloc]init];
    NSLog(param);
    sqlInsert.sqlid    = [param intValue];
    
    [sqlSer deleteTestList:sqlInsert];
    [sqlSer release];
    
    [self performSegueWithIdentifier:@"editback" sender:self];

}

- (IBAction)hiden:(id)sender {
       [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]; 
}
- (IBAction)update:(id)sender {
    CountSqlService   *sqlSer = [[CountSqlService alloc] init];
    sqlCountList *sqlInsert = [[sqlCountList alloc]init];
    sqlInsert.countNum = _countnum.text;
    sqlInsert.countType = _counttype.text;
    sqlInsert.sqlid    = [param intValue];
    
    [sqlSer updateTestList:sqlInsert];
    [self performSegueWithIdentifier:@"editback" sender:self];

    
}
@end
