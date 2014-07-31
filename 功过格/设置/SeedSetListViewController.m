//
//  SeedSetListViewController.m
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SeedSetListViewController.h"
#import "SeedSQLService.h"
@interface SeedSetListViewController ()

@end

@implementation SeedSetListViewController
 
@synthesize param;
@synthesize paramname; 
NSMutableArray* seedList;
@synthesize rightSwipeGestureRecognizer,leftSwipeGestureRecognizer;

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
    
    //绑定TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem* btnNew = [[UIBarButtonItem alloc]
                               initWithTitle:NSLocalizedString(@"addNew", nil)
                               style:UIBarButtonItemStyleBordered
                               target:self
                               action:@selector(onNew:)];
    
    self.navigationItem.rightBarButtonItem = btnNew;
    [btnNew release];
    
    self.navigationItem.title = NSLocalizedString(@"seedSetting", nil);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SeedSQLService   *sqlSer = [[SeedSQLService alloc] init];
    seedList= [sqlSer getTestList];
    [sqlSer release];
    
    
    [self.tableView reloadData];
    
    if (param)
    {
        [param release];
        param = nil;
    }
    if (paramname)
    {
        [paramname release];
        paramname = nil;
    }
}


- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self performSegueWithIdentifier:@"seedSetNew" sender:self];
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [seedList count];
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
    if(indexPath.row<seedList.count){
        sqlSeedList *a=   [seedList objectAtIndex:indexPath.row];
        
        cell.textLabel.text=a.seedName;
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
    
     if(indexPath.row<seedList.count){
    sqlSeedList *a=   [seedList objectAtIndex:indexPath.row];
    
    
    NSLog(@"jumpingtoEdddit");
    
    NSString *str1 = [NSString stringWithFormat:@"%d",a.sqlid];
 

    param=str1;
    paramname=a.seedName;
     [self performSegueWithIdentifier:@"seedEdit" sender:self];
     }
    [UIView commitAnimations];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    
  if(param){
       id segue2 = segue.destinationViewController;
      [segue2 setValue:param forKey:@"param"];
      [segue2 setValue:paramname forKey:@"paramname"];
   }
    
    
//    NSLog(@"jumping.......");
}

- (void)dealloc {
    [super dealloc];
}


-(void)onNew:(id)sender
{
    [self performSegueWithIdentifier:@"seedSetNew" sender:self];
}
@end

