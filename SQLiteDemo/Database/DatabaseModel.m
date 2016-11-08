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

+ (BOOL)saveWord:(NSInteger)wordId andJapaneseString:(NSString *)japaneseText andVietNameseText:(NSString *)vietnameseText andExample:(NSString *)example withUserId:(NSInteger)userId{
    BOOL isSuccess = NO;
     NSString *queryStr;
    if (wordId) {
        //Update Word
        queryStr = [NSString stringWithFormat:@"UPDATE words SET japanese='%@',vietnamese='%@',example='%@' WHERE wordId='%lu'",japaneseText,vietnameseText,example,wordId];
    }else{
        //New Word
        queryStr = [NSString stringWithFormat:@"INSERT INTO words(japanese,vietnamese,example,userId) values ('%@','%@','%@',%lu)",japaneseText,vietnameseText,example,userId];
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

+ (BOOL)deleteWord:(NSInteger)wordId{
    BOOL isSuccess = NO;
    NSString *queryStr;
    queryStr = [NSString stringWithFormat:@"DELETE FROM words WHERE wordId='%ld'",(long)wordId];
    DBManager *db = [DBManager getSharedInstance];
    isSuccess = [db excuteSaveDataQuery:queryStr];
    return isSuccess;
}

@end
