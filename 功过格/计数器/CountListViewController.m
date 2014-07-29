//
//  CountListViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "CountListViewController.h"
#import "CountSqlService.h"
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
    
    _tables.delegate=self;
    _tables.dataSource=self;
    
    CountSqlService   *sqlSer = [[CountSqlService alloc] init];
    
    
    counterList= [sqlSer getTestList];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self performSegueWithIdentifier:@"countBackToMain" sender:self];         
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"countBackToMain" sender:self];
        
        
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
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
    
    
    
    NSString *str1 = [NSString stringWithFormat:@"%d",a.sqlid];
    param=str1;
    paramnum=a.countNum;
    paramtype=a.countType;
    [self performSegueWithIdentifier:@"CountListToDetail" sender:self];
    [UIView commitAnimations];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if(param){
        id segue2 = segue.destinationViewController;
        [segue2 setValue:param forKey:@"param"];
        [segue2 setValue:paramtype forKey:@"paramtype"];
        [segue2 setValue:paramnum forKey:@"paramnum"];
    }
    
    
    NSLog(@"jumping.......");
}

- (void)dealloc {
    [_tables release];
    [super dealloc];
}
@end

