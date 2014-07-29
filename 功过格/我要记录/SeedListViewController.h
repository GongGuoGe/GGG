//
//  SeedListViewController.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeedListViewController : UITableViewController

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (retain, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (strong, nonatomic) NSString *paramname;
@property (strong, nonatomic) NSString *param;
@end
