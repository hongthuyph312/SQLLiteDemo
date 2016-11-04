//
//  DBManager.m
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "DBManager.h"
#define DB_NAME @"managerDB.sql"
#define DOCUMENT_PATH [NSHomeDirectory() stringByAppendingFormat:@"/Documents/"]

static DBManager *sharedInstance = nil;
@implementation DBManager

+ (DBManager *)getSharedInstance{
    if (!sharedInstance) {
        [DBManager copyDatabaseIntoDocumentsDirectory];
        sharedInstance = [[DBManager alloc] init];
    }
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        // Get the documents directory path
        NSString *databasePath = [NSString stringWithFormat:@"%@%@",DOCUMENT_PATH,DB_NAME];
        sqlite3 *sqliteDatabase;
        BOOL openDatabase = sqlite3_open([databasePath UTF8String], &sqliteDatabase);
        if (openDatabase == SQLITE_OK) {
            NSLog(@"Open database success !!!");
        }else{
            NSLog(@"Open database error !!!");
            return nil;
        }
        database = sqliteDatabase;
    }
    return self;
}

+ (void)copyDatabaseIntoDocumentsDirectory{
    
    NSString *databasePath = [NSString stringWithFormat:@"%@%@",DOCUMENT_PATH,DB_NAME];
    
    // Check if the database file exists in the documents directory.
    
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_NAME];
    
    // check file is exit or not
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    if (![fileManager fileExistsAtPath:databasePath]) {
        // The database file does not exist in the documents directory, so copy it from the main bundle now.
        [fileManager copyItemAtPath:sourcePath toPath:databasePath error:&error];
        
        // Check if any error occurred during copying and display it.
        if (error != nil) {
            NSLog(@" --------- Copy database error ----------- \n %@ \n ------------------------------ ", [error localizedDescription]);
        } else {
            NSLog(@"Copy database successfully");
        }
    }
}

- (NSArray *)excuteGetDataQuery:(NSString *)queryString{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    const char *sql = [queryString UTF8String];
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(database, sql, -1, &stmt, NULL) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init]; // dictionary for each object of array
            // get total colum
            int totalColums = sqlite3_column_count(stmt);
            for (int i = 0; i < totalColums; i++) {
                int columType = sqlite3_column_type(stmt, i);
                NSString *columName = [NSString stringWithUTF8String:sqlite3_column_name(stmt, i)];
                // get value of colum i
                id columValue;
                switch (columType) {
                    case SQLITE_TEXT:
                        columValue = [NSString stringWithUTF8String:(char *)sqlite3_column_text(stmt, i)];
                        break;
                    case SQLITE_INTEGER:
                        columValue = [NSNumber numberWithInt:sqlite3_column_int(stmt, i)];
                        break;
                    case SQLITE_NULL:
                        columValue = @"";
                        break;
                    default:
                        NSLog(@"Don't check datatype");
                        break;
                }
                [dict setObject:columValue forKey:columName];
            }
            [resultArray addObject:dict];
        }
    }
    return resultArray;
}

- (BOOL)excuteSaveDataQuery:(NSString *)queryString{
    const char *sql = [queryString UTF8String];
    sqlite3_stmt *stmt;
    int prepareStatus = sqlite3_prepare_v2(database, sql, -1, &stmt, NULL);
    if (prepareStatus == SQLITE_OK) {
        if (sqlite3_step(stmt) == SQLITE_DONE) {
            return YES;
        } else {
             NSLog(@"sqlite3_step error %s", sqlite3_errmsg(database));
            return NO;
        }
    } else {
        NSLog(@"sqlite3_prepare_v2 error - cannot be opened database %s", sqlite3_errmsg(database));
        return NO;
    }
    
}

@end
