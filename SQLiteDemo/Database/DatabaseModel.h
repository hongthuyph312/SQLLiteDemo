//
//  DatabaseModel.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/3/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"
#import "UserModel.h"
#import "WordModel.h"

@interface DatabaseModel : NSObject

+ (BOOL)createNewUser:(NSString *)email andPassword:(NSString *)password;
+ (NSArray *)loginWithUser:(NSString *)email andPassword:(NSString *)password;
+ (BOOL)saveWord:(NSInteger) wordId andJapaneseString:(NSString *)japaneseText andVietNameseText:(NSString *)vietnameseText andExample:(NSString *)example withUserId:(NSInteger)userId;
+ (NSArray *)getListWordWithUserId:(NSUInteger)userId;
+ (BOOL)deleteWord:(NSInteger)wordId;

@end
