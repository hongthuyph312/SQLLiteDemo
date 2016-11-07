//
//  DatabaseModel.m
//  SQLiteDemo
//
//  Created by ThuyPH on 11/3/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "DatabaseModel.h"


@implementation DatabaseModel

+ (BOOL)createNewUser:(NSString *)email andPassword:(NSString *)password{
    BOOL isSuccess = NO;
     NSString *queryStr = [NSString stringWithFormat:@"INSERT INTO users (email,password) values ('%@','%@')",email,password];
    DBManager *db = [DBManager getSharedInstance];
    isSuccess = [db excuteSaveDataQuery:queryStr];
    return isSuccess;
}

+ (NSArray *)loginWithUser:(NSString *)email andPassword:(NSString *)password{
    NSString *queryStr = [NSString stringWithFormat:@"SELECT * FROM users where email = '%@' and password = '%@'",email,password];
    DBManager *db = [DBManager getSharedInstance];
    NSArray *arrData = [db excuteGetDataQuery:queryStr];
    if (arrData.count > 0) {
        NSMutableArray *arrNew = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrData.count; i++) {
            [arrNew addObject:[[UserModel alloc] initWithDict:arrData[i]]];
        }
        return arrNew;
    }
    return arrData;
}

+ (BOOL)saveWord:(NSInteger)wordId andJapaneseString:(NSString *)japaneseText andVietNameseText:(NSString *)vietnameseText andType:(NSUInteger)type andExample:(NSString *)example withUserId:(NSInteger)userId{
    BOOL isSuccess = NO;
     NSString *queryStr;
    if (wordId) {
        //Update Word
        
    }else{
        //New Word
        queryStr = [NSString stringWithFormat:@"INSERT INTO words(japanese,vietnamese,type,example,userId) values ('%@','%@',%lu,'%@',%lu)",japaneseText,vietnameseText,(unsigned long)type,example,userId];
    }
    DBManager *db = [DBManager getSharedInstance];
    isSuccess = [db excuteSaveDataQuery:queryStr];
    return isSuccess;
}

+ (NSArray *)getListWordWithUserId:(NSUInteger)userId{
    NSString *queryStr = [NSString stringWithFormat:@"SELECT * FROM words where userId = '%lu'",(unsigned long)userId];
    DBManager *db = [DBManager getSharedInstance];
    NSArray *arrData = [db excuteGetDataQuery:queryStr];
    if (arrData.count > 0) {
        NSMutableArray *arrNew = [[NSMutableArray alloc] init];
        for (int i = 0; i < arrData.count; i++) {
            [arrNew addObject:[[WordModel alloc] initWithDict:arrData[i]]];
        }
        return arrNew;
    }
    return arrData;
}
@end
