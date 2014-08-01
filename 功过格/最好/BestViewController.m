//
//  BestViewController.m
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import "BestViewController.h"
#import <QuartzCore/QuartzCore.h> 
#import "RecordSQLService.h"

@interface BestViewController ()

@end

@implementation BestViewController
@synthesize rightSwipeGestureRecognizer,leftSwipeGestureRecognizer;
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
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
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
    
    //_bestText.layer.borderColor = [UIColorgrayColor].CGColor;
    _bestText.layer.borderWidth =1.0;
    _bestText.layer.cornerRadius =5.0;
    
    _bedText.layer.borderWidth =1.0;
    _bedText.layer.cornerRadius =5.0;
    
    _wantText.layer.borderWidth =1.0;
    _wantText.layer.cornerRadius =5.0;
    
    self.navigationItem.title = NSLocalizedString(@"best", nil);
    
    _bestText.delegate = self;
    _bedText.delegate = self;
    _wantText.delegate = self;
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

- (IBAction)hiden:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_bestText release];
    [_bedText release];
    [_wantText release];
    [super dealloc];
}
- (IBAction)AddBest:(id)sender {
    RecordSQLService   *sqlSer = [[RecordSQLService alloc] init];
    sqlRecordList *sqlInsert = [[sqlRecordList alloc]init];
    sqlInsert.seedName = @"最好";
    sqlInsert.righttext = _bestText.text;
   sqlInsert.wrongtext=_bedText.text;
   sqlInsert.willtext=_wantText.text;
//    
//    //调用封装好的数据库插入函数
    if ([sqlSer insertTestList:sqlInsert]) {
       [self performSegueWithIdentifier:@"bestToMain" sender:self];
   }
    else {
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                       message:@"插入数据失败"
                                                      delegate:self
                                             cancelButtonTitle:nil
                                              otherButtonTitles:nil];
        [alert show];
        
    }

}

-(void)textViewDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    float offset = kbHeight - (self.view.frame.size.height - (frame.origin.y + frame.size.height));
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    oldY = self.view.frame.origin.y;
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, oldY-offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textViewShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textViewDidEndEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame =CGRectMake(0, oldY, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}


//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    kbHeight = keyboardRect.size.height;
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    
}


@end
