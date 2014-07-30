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
    
    CGRect parentSz = self.view.bounds;
    CGRect bds = [nb bounds];
    bds.size.width = parentSz.size.width;
    [nb setBounds:bds];

    CGRect matrixSz;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
    {
        matrixSz = CGRectMake(0, bds.size.height + 10, parentSz.size.width, parentSz.size.height - bds.size.height);
    }
    else
    {
        matrixSz = CGRectMake(0, bds.size.height - 10, parentSz.size.width, parentSz.size.height - bds.size.height);
    }
    
    NALLabelsMatrix* matrix = [[NALLabelsMatrix alloc]
                               initWithFrame:matrixSz
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
