//
//  CountListViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "CountListViewController.h"
#import "CountSqlService.h"
#import "CountViewController.h"

@interface CountListViewController ()

@end

@implementation CountListViewController
@synthesize rightSwipeGestureRecognizer,leftSwipeGestureRecognizer;
@synthesize param;
@synthesize paramtype;
@synthesize paramnum;
NSMutableArray* counterList;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CountSqlService *sqlSer = [[CountSqlService alloc] init];
    counterList= [sqlSer getTestList];
    [sqlSer release];
    param = -1;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [counterList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //绑定tableview
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell){
        cell=[[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:(CellIdentifier)]
              autorelease];
    }
    //
    if(indexPath.row<counterList.count){
        sqlCountList *a=   [counterList objectAtIndex:indexPath.row];
        
        cell.textLabel.text=a.countType;
    }
    
    //半透明背景
    UIColor *altCellColor = [UIColor colorWithWhite:1.0 alpha:0.1];
    
    cell.backgroundColor = altCellColor;
    altCellColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    cell.textLabel.backgroundColor = altCellColor;
    cell.detailTextLabel.backgroundColor = altCellColor;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.row<counterList.count){
    sqlCountList *a=   [counterList objectAtIndex:indexPath.row];

    param = a.sqlid;
    paramnum = a.countNum;
    paramtype = a.countType;
    [self performSegueWithIdentifier:@"CountListToDetail" sender:self];
    [UIView commitAnimations];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if(param != -1){
        CountViewController* segue2 = segue.destinationViewController;
        segue2.param = param;
        segue2.paramtype = paramtype;
        segue2.paramnum = paramnum;
    }
    
    
    NSLog(@"jumping.......");
}

- (void)dealloc {
    [super dealloc];
}
@end

