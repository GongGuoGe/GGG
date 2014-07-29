//
//  BestSqlService.h
//  功过格
//
//  Created by Apple on 14-2-16.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define kFilename  @"Gongguoge.db"
@class sqlBestList;
@interface BestSqlService : NSObject
{
sqlite3  *_database;
}
@property (nonatomic) sqlite3 *_database;
-(BOOL) createTestList:(sqlite3 *)db;//创建数据库
-(BOOL) insertTestList:(sqlBestList *)insertList;//插入数据

@end

@interface sqlBestList : NSObject
{
    NSInteger *sqlid;
	NSString *seedName;
    NSString *bedSeed;
    NSString *wantSeed;
    NSDate *logDateTime;
}
@property (nonatomic) NSInteger *sqlid;
@property (nonatomic, retain) NSString *seedName;
@property (nonatomic, retain) NSString *goodSeed;
@property (nonatomic, retain) NSString *bedSeed;
@property (nonatomic, retain) NSString *wantSeed;
@property (nonatomic, retain) NSDate *logDateTime;

@end
