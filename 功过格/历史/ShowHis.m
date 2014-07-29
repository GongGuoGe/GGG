//
//  ShowHis.m
//  功过格
//
//  Created by davia on 14-2-18.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ShowHis.h"

@interface ShowHis ()

@end

@implementation ShowHis
@synthesize param;
@synthesize param2;
@synthesize right;
@synthesize wrong;
@synthesize will;
@synthesize seddnamevalue;
@synthesize addtimevalue;
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
        [_seedname setText:seddnamevalue];
        [_addtime setText:addtimevalue];
        [_rightttext setText:right];
        [_wrongtext setText:wrong];
        [_willtext setText:will];
    
    
    
    }
    
    
    
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
}



- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self performSegueWithIdentifier:@"DetailToHis" sender:self];
        
        
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"DetailToHis" sender:self];
        
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //
    if(param){
        id segue2 = segue.destinationViewController;
        [segue2 setValue:param forKey:@"param"];
       
    }
    
    
    //    NSLog(@"jumping.......");
}

- (IBAction)hiden:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (void)dealloc {
    [_rightttext release];
    [_wrongtext release];
    [_willtext release];
    [_seedname release];
    [_addtime release];
    [super dealloc];
}
@end
