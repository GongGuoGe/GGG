//
//  SeedSQLService.h
//  功过格
//
//  Created by Apple on 14-2-14.
//  Copyright (c) 2014年 powerplayer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define kFilename  @"Gongguoge.db"
@class sqlSeedList;
@interface SeedSQLService : NSObject{
    sqlite3  *_database;
    
}

@property (nonatomic) sqlite3 *_database;
-(BOOL) createTestList:(sqlite3 *)db;//创建数据库
-(BOOL) insertTestList:(sqlSeedList *)insertList;//插入数据
-(BOOL) updateTestList:(sqlSeedList *)updateList;//更新数据
-(NSMutableArray*)getTestList;//获取全部数据
- (BOOL) deleteTestList:(sqlSeedList *)deletList;//删除数据：
- (NSMutableArray*)searchTestList:(int)searchID;//查询数据库，searchID为要查询数据的ID，返回数据为查询到的数据
@end

@interface sqlSeedList : NSObject
{
    int sqlid;
	NSString *seedName; 
}
@property (assign) int sqlid;
@property (nonatomic, retain) NSString *seedName; 
@end

