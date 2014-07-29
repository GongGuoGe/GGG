//
//  ExpSeedList.m
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ExpSeedList.h"
#import "SeedSQLService.h"
@interface ExpSeedList ()

@end

@implementation ExpSeedList
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
    _tableview.delegate=self;
    _tableview.dataSource=self;
    
    SeedSQLService   *sqlSer = [[SeedSQLService alloc] init];
    
    
    seedList= [sqlSer getTestList];
    
    [sqlSer release];
}


- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self performSegueWithIdentifier:@"ExpBackToMain" sender:self];
        
        
        
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"ExpBackToMain" sender:self];
        
        
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row<seedList.count){
        sqlSeedList *a=   [seedList objectAtIndex:indexPath.row];
        
        
        NSLog(@"jumpingtoEdddit");
        
        NSString *str1 = [NSString stringWithFormat:@"%d",a.sqlid];
        
        
        param=str1;
        paramname=a.seedName;
        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"mail" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        

        
      
       NSString *accout =[NSString stringWithFormat:@"%@",[data objectForKey:@"accout"]];
          NSString *passwd =[NSString stringWithFormat:@"%@",[data objectForKey:@"passwd"]];
          NSString *smtp =[NSString stringWithFormat:@"%@",[data objectForKey:@"smtp"]];
        
        if(param){
            if(accout.length>2&&passwd.length>2&&smtp.length>2){
            
                [self performSegueWithIdentifier:@"SeedListToSelect" sender:self];
            }else{
            
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:@"您没有设置用于发送备份文件的邮箱，请到设置内设置" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            
                
                param=str1;
                paramname=a.seedName;
            }
            
        }
    }
    [UIView commitAnimations];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //
    if(param){
        if(param.length>0){
            id segue2 = segue.destinationViewController;
            [segue2 setValue:param forKey:@"param"];
            [segue2 setValue:paramname forKey:@"paramname"];
        }
    }
    
    
    //    NSLog(@"jumping.......");
}


@end
