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
    //创建一个导航栏
    CGRect navBarSize = CGRectMake(0, 0, parentSz.size.width, 44);
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
    {
        navBarSize.origin.y += 20;
    }
    UINavigationBar* navBar = [[UINavigationBar alloc] initWithFrame:navBarSize];
    //创建一个导航栏集合
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    //在这个集合Item中添加标题，按钮
    //style:设置按钮的风格，一共有三种选择
    //action：@selector:设置按钮的点击事件
    //创建一个左边按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(clickLeftButton:)];
    //创建一个右边按钮
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton)];
    
    //设置导航栏的内容
    navItem.title = NSLocalizedString(@"today", nil);
    
    //把导航栏集合添加到导航栏中，设置动画关闭
    [navBar pushNavigationItem:navItem animated:NO];
    
    //把左右两个按钮添加到导航栏集合中去
    [navItem setLeftBarButtonItem:leftButton];
//    [navItem setRightBarButtonItem:rightButton];
    
    //将标题栏中的内容全部添加到主视图当中
    [self.view addSubview:navBar];
    
    //最后将控件在内存中释放掉，以避免内存泄露
    [navBar release];
    [navItem release];
    [leftButton release];
//    [rightButton release];

    CGRect matrixSz;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
    {
        matrixSz = CGRectMake(0, navBarSize.size.height + 20, parentSz.size.width, parentSz.size.height - navBarSize.size.height);
    }
    else
    {
        matrixSz = CGRectMake(0, navBarSize.size.height, parentSz.size.width, parentSz.size.height - navBarSize.size.height);
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


-(void)clickLeftButton:(id)sender
{
    [self performSegueWithIdentifier:@"backToMain" sender:self];
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
