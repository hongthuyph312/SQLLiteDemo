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


@end
