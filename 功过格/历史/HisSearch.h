//
//  HisSearch.h
//  功过格
//
//  Created by davia on 14-2-18.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HisSearch : UITableViewController
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;

@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (strong, nonatomic) NSString *param;
@property (strong, nonatomic) NSString *param2;
@property (retain, nonatomic) IBOutlet UITableView *tablevies;
@property (strong, nonatomic) NSString *right;
@property (strong, nonatomic) NSString *wrong;
@property (strong, nonatomic) NSString *will;
@property (strong, nonatomic) NSString *addtimevalue;
@property (strong, nonatomic) NSString *seddnamevalue;
@end
