//
//  TodayViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "TodayViewController.h"
#import "RecordSQLService.h"
#import "NALLabelsMatrix.h"

@interface TodayViewController ()

@end

@implementation TodayViewController
NSMutableArray* list;
@synthesize rightSwipeGestureRecognizer,leftSwipeGestureRecognizer;


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
    [super viewDidLoad];
    
    RecordSQLService   *sqlSer = [[RecordSQLService alloc] init];
    sqlRecordList *sqlInsert = [[sqlRecordList alloc]init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    sqlInsert.addtime = [dateFormatter stringFromDate: [NSDate date]];
    
    list= [sqlSer  getThisDay:sqlInsert];
    [sqlSer release];
    [dateFormatter release];
    
//    DataGridComponentDataSource* ds = [[DataGridComponentDataSource alloc] init];
//    ds.columnWidth = [NSMutableArray arrayWithObjects:@"40", @"100", @"170", @"170", @"170", @"120", @"70", nil];
//    ds.titles = [NSMutableArray arrayWithObjects:@"编号", @"类型", @"正面", @"负面", @"我要", @"时间", nil];
//    ds.data = dates;
//    
//    CGRect bds = [nb bounds];
//    DataGridComponent *grid = [[DataGridComponent alloc] initWithFrame:CGRectMake(0, bds.size.height, 500, 600 - bds.size.height) data:ds];
//    [ds release];
//    [self.view addSubview:grid];
//    [grid release];

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    NSMutableArray *dates = [[NSMutableArray alloc] init];
    CGRect parentSz = self.view.frame;
    CGRect bds = [nb bounds];
    float s = self.view.contentScaleFactor;

    NALLabelsMatrix* matrix = [[NALLabelsMatrix alloc]
                               initWithFrame:CGRectMake(0, bds.size.height, parentSz.size.height, parentSz.size.width - bds.size.height)
                               andColumnsWidths:[[NSArray alloc] initWithObjects:@40, @100, @170, @170, @170, @120, nil]];
    
    [matrix addRecord:[[NSArray alloc] initWithObjects:@"编号", @"类型", @"正面", @"负面", @"我要", @"时间", nil]];
    
    for (sqlRecordList  *one in list) {
        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        
        [tmp addObject:[NSString stringWithFormat:@"%d",one.sqlid]];
        [tmp addObject:one.seedName];
        [tmp addObject:one.righttext];
        [tmp addObject:one.wrongtext];
        [tmp addObject:one.willtext];
        [tmp addObject:one.addtime];
        
        [matrix addRecord:tmp];
        [matrix addRecord:tmp];
        [tmp release];
    }
    
    [self.view addSubview:matrix];
    [matrix release];
    
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
