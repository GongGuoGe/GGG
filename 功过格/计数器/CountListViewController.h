//
//  CountListViewController.h
//  功过格
//
//  Created by Apple on 14-2-15.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountListViewController : UITableViewController
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (retain, nonatomic) IBOutlet UITableView *tables;

@property (retain, nonatomic) IBOutlet UITableView *tableViews;
@property (strong, nonatomic) NSString *paramtype;
@property (strong, nonatomic) NSString *paramnum;
@property (strong, nonatomic) NSString *param;
@end
