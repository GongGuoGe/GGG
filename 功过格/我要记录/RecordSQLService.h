//
//  RecordSQLService.h
//  功过格
//
//  Created by davia on 14-2-17.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define kFilename  @"Gongguoge.db"
@class sqlRecordList;
@interface RecordSQLService : NSObject{
    sqlite3  *_database;
    
}

@property (nonatomic) sqlite3 *_database;
-(BOOL) createTestList:(sqlite3 *)db;//创建数据库
-(BOOL) insertTestList:(sqlRecordList *)insertList;//插入数据
-(BOOL) updateTestList:(sqlRecordList *)updateList;//更新数据
-(NSMutableArray*)getTestList;//获取全部数据


-(NSMutableArray*)getThisMon:(sqlRecordList *)insertList;
-(NSMutableArray*)getThisDay:(sqlRecordList *)insertList;
-(NSMutableArray*)getListForExp:(sqlRecordList *)insertList;
- (BOOL) deleteTestList:(sqlRecordList *)deletList;//删除数据：
- (NSMutableArray*)searchTestList:(int)searchID;//查询数据库，searchID为要查询数据的ID，返回数据为查询到的数据
@end

@interface sqlRecordList : NSObject
{
    NSInteger *sqlid;
	NSString *seedName;
    NSString *righttext;
    NSString *wrongtext;
    NSString *willtext;
    NSString *addtime;
}
@property (nonatomic) NSInteger *sqlid;
@property (nonatomic, retain) NSString *seedName;
@property (nonatomic, retain) NSString *righttext;
@property (nonatomic, retain) NSString *wrongtext;
@property (nonatomic, retain) NSString *willtext;
@property (nonatomic, retain) NSString *addtime;
@end
