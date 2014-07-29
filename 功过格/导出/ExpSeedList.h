//
//  ExpSeedList.h
//  功过格
//
//  Created by davia on 14-2-21.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpSeedList : UITableViewController
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (retain, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@property (strong, nonatomic) NSString *paramname;
@property (strong, nonatomic) NSString *param;
@end
