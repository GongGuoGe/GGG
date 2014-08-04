//
//  ShowHis.m
//  功过格
//
//  Created by davia on 14-2-18.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "ShowHis.h"
#import "UMSocial.h"


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

- (NSString*)getRideOfLn:(NSString*)str
{
    NSString* ret = str;
    while ([ret hasSuffix:@"\n"])
    {
        ret = [ret substringToIndex:[ret length] - 1];
    }
    
    return ret;
}


- (void)viewDidLoad
{
    
    if(param){
        self.right = [self getRideOfLn:right];
        self.wrong = [self getRideOfLn:wrong];
        self.will = [self getRideOfLn:will];
        [_addtime setText:addtimevalue];
        [_rightttext setText:right];
        [_wrongtext setText:wrong];
        [_willtext setText:will];
    }
    
    
    
    UIImage *bgImage = [UIImage imageNamed:@"bg.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(onShare:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    //设置手势操作
    
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    [super viewDidLoad];
    
    self.navigationItem.title = seddnamevalue;
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
    [_addtime release];
    [super dealloc];
}


- (void)onShare:(id)sender
{
    //在分享代码前设置微信分享应用类型，用户点击消息将跳转到应用，或者到下载页面
    //UMSocialWXMessageTypeImage 为纯图片类型
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeText;
    //分享图文样式到微信朋友圈显示字数比较少，只显示分享标题
    [UMSocialData defaultData].extConfig.title = @"朋友圈分享内容";
    //设置微信好友或者朋友圈的分享url,下面是微信好友，微信朋友圈对应wechatTimelineData
//    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://www.baidu.com";
//    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.baidu.com";
    
    NSString* text = [NSString stringWithFormat:@"种子: %@\n正面: %@\n负面: %@\n我要: %@\n\n创建于: %@",
                      seddnamevalue, right, wrong, will, addtimevalue];
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"53d9e03756240b5b54000210"
                                      shareText:text
                                     shareImage:[UIImage imageNamed:@"ico6.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSms, UMShareToEmail, UMShareToWechatSession, UMShareToWechatTimeline, UMShareToWechatFavorite/*, UMShareToSina, UMShareToTencent*/,nil]
                                       delegate:self];
}


//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

@end
