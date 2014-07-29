//
//  TodayViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "TodayViewController.h"
#import "DataGridComponent.h"
#import "RecordSQLService.h"
@interface TodayViewController ()

@end

@implementation TodayViewController
NSMutableArray* list;
@synthesize rightSwipeGestureRecognizer,leftSwipeGestureRecognizer;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSUInteger)supportedInterfaceOrientations
{
    //    return UIInterfaceOrientationMaskLandscapeLeft;
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
   return UIInterfaceOrientationLandscapeRight;
    //    return UIInterfaceOrientationPortrait;
}




- (void)viewDidLoad
{
 
    RecordSQLService   *sqlSer = [[RecordSQLService alloc] init];
    sqlRecordList *sqlInsert = [[sqlRecordList alloc]init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    sqlInsert.addtime= [dateFormatter stringFromDate: [NSDate date]];
    
    list= [sqlSer  getThisDay:sqlInsert];
    [sqlSer release];
    [dateFormatter release];
    
    
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    
    for (sqlRecordList  *one in list) {
        NSMutableArray *tmp = [[NSMutableArray alloc] init];

        
        [tmp addObject:[NSString stringWithFormat:@"%d",one.sqlid]];
        [tmp addObject:one.seedName];
        [tmp addObject:one.righttext];
        [tmp addObject:one.wrongtext];
        [tmp addObject:one.willtext];
   
        [tmp addObject:one.addtime];
       
        
      
        [dates addObject:tmp];
    }
    

    
    
    
    
    
        DataGridComponentDataSource *ds = [[DataGridComponentDataSource alloc] init];
        ds.columnWidth = [NSArray arrayWithObjects:@"40", @"100", @"170", @"170", @"170", @"120", @"70", nil];
        ds.titles = [NSArray arrayWithObjects:@"编号", @"类型", @"正面", @"负面", @"我要", @"时间", nil];
    
    ds.data=dates;
    
    
    
    
    
              DataGridComponent *grid = [[DataGridComponent alloc] initWithFrame:CGRectMake(0, 0, 500, 600) data:ds];
        [ds release];
        [self.view addSubview:grid];
        [grid release];
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
        [self performSegueWithIdentifier:@"todayToMain" sender:self];
        
        
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"todayToMain" sender:self];
        
        
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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
