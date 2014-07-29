//
//  CountSqlService.h
//  功过格
//
//  Created by Apple on 14-2-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define kFilename  @"Gongguoge.db"
@class sqlCountList;
@interface CountSqlService : NSObject{
sqlite3  *_database;

}

@property (nonatomic) sqlite3 *_database;
-(BOOL) createTestList:(sqlite3 *)db;//创建数据库
-(BOOL) insertTestList:(sqlCountList *)insertList;//插入数据
-(BOOL) updateTestList:(sqlCountList *)updateList;//更新数据
-(NSMutableArray*)getTestList;//获取全部数据
- (BOOL) deleteTestList:(sqlCountList *)deletList;//删除数据：
- (NSMutableArray*)searchTestList:(int)searchID;//查询数据库，searchID为要查询数据的ID，返回数据为查询到的数据
@end

@interface sqlCountList : NSObject
{
    NSInteger *sqlid;
	NSString *countType;
    NSString *countNum;
}
@property (nonatomic) NSInteger *sqlid;
@property (nonatomic, retain) NSString *countType;
@property (nonatomic, retain) NSString *countNum;
@end

