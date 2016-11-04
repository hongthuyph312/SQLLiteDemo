//
//  DBManager.h
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject{
    sqlite3 *database;
    NSString *documentDirectory;
    NSString *databasePath;
}

+ (DBManager *)getSharedInstance;
- (NSArray *)excuteGetDataQuery:(NSString *)queryString;
- (BOOL)excuteSaveDataQuery:(NSString *)queryString;
@end
