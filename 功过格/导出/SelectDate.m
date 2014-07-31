//
//  SelectDate.m
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "SelectDate.h"
#import "RecordSQLService.h"
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"

void alert(NSString* msg);
@interface SelectDate ()

@end

@implementation SelectDate
@synthesize param;
@synthesize paramname;
NSMutableArray* seedList;
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
    
    self.navigationItem.title = NSLocalizedString(@"selectDate", nil);
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
    //SelectDateToList
}

- (void)dealloc {
    [_startdate release];
    [_enddate release];
    [_exportbtn release];
    [super dealloc];
}




- (void)createFile:(NSString *)fileName {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:fileName error:nil];
    
    
    if (![fileManager createFileAtPath:fileName contents:nil attributes:nil]) {
        NSLog(@"不能创建文件");
    }
    
}

- (void)exportCSV:(NSString *)fileName {
    
    
    NSOutputStream *output = [[NSOutputStream alloc] initToFileAtPath:fileName append:YES];
    [output open];
    
    
    if (![output hasSpaceAvailable]) {
        NSLog(@"没有足够可用空间");
    } else {
        
        NSString *header = @"编号,正面,负面,我要,类型,时间\n";
        const uint8_t *headerString = (const uint8_t *)[header cStringUsingEncoding:NSUTF8StringEncoding];
        NSInteger headerLength = [header lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
        NSInteger result = [output write:headerString maxLength:headerLength];
        if (result <= 0) {
            NSLog(@"写入错误");
        }
        RecordSQLService   *sqlSer = [[RecordSQLService alloc] init];
        sqlRecordList *sqlInsert = [[sqlRecordList alloc]init];
        sqlInsert.addtime= [[NSString alloc] initWithFormat:@"%@",[_startdate date]];

        sqlInsert.willtext= [[NSString alloc] initWithFormat:@"%@",[_enddate date]];
        sqlInsert.seedName=paramname;
        
        seedList= [sqlSer  getListForExp:sqlInsert];

        
        for (sqlRecordList *stu in seedList) {
            
            NSString *row = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@\n", stu.init, stu.righttext,stu.wrongtext,stu.willtext,stu.seedName,stu.addtime];
            const uint8_t *rowString = (const uint8_t *)[row cStringUsingEncoding:NSUTF8StringEncoding];
            NSInteger rowLength = [row lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
            result = [output write:rowString maxLength:rowLength];
            if (result <= 0) {
                NSLog(@"无法写入内容");
            }
            
        }
        
        [output close];
    }
}


- (IBAction)expevent:(id)sender {
    
    
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDirectory, YES);
    NSString *docementDir = [documents objectAtIndex:0];
    NSString *filePath = [docementDir stringByAppendingPathComponent:@"export.csv"];
    NSLog(@"filePath = %@", filePath);
    
    [self createFile:filePath];
    [self exportCSV:filePath];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"mail" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    
    
    
    NSString *accout =[NSString stringWithFormat:@"%@",[data objectForKey:@"accout"]];
    NSString *passwd =[NSString stringWithFormat:@"%@",[data objectForKey:@"passwd"]];
    NSString *smtp =[NSString stringWithFormat:@"%@",[data objectForKey:@"smtp"]];

    
    
    
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    //发送者
    testMsg.fromEmail = accout;
    //发送给
    testMsg.toEmail =accout;
    //发送有些的发送服务器地址
    testMsg.relayHost = smtp;
    //需要鉴权
    testMsg.requiresAuth = YES;
    //发送者的登录账号
    testMsg.login = accout;
    //发送者的登录密码
    testMsg.pass = passwd;
    //邮件主题
    testMsg.subject = [NSString stringWithCString:"功过格备份" encoding:NSUTF8StringEncoding ];
    
    testMsg.wantsSecure = YES; // smtp.gmail.com doesn't work without TLS!
    
    testMsg.delegate = self;
    
    //主题
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain",kSKPSMTPPartContentTypeKey,
                               @"This is a test message.\r\n支持中文。",kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    
    
    NSData *vcfData = [NSData dataWithContentsOfFile:filePath];
    
    //附件图片文件
    NSDictionary *vcfPart = [[NSDictionary alloc ]initWithObjectsAndKeys:@"text/directory;\r\n\tx-unix-mode=0644;\r\n\tname=\"export.csv\"",kSKPSMTPPartContentTypeKey,
                             @"attachment;\r\n\tfilename=\"export.csv\"",kSKPSMTPPartContentDispositionKey,[vcfData encodeBase64ForData],kSKPSMTPPartMessageKey,@"base64",kSKPSMTPPartContentTransferEncodingKey,nil];
  
    testMsg.parts = [NSArray arrayWithObjects:plainPart,vcfPart,nil, nil];
    
    [testMsg send];

    
}



- (void)messageSent:(SKPSMTPMessage *)message
{
    [message release];
    
    //发送成功
    NSLog(@"delegate - message sent");
    alert(@"发送成功");
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    [message release];
    
    //发送失败
    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
    alert(@"发送失败");
}



void alert(NSString* msg)
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
@end
