//
//  DatabaseModel.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/3/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface DatabaseModel : NSObject

+ (BOOL)createNewUser:(NSString *)email andPassword:(NSString *)password;

@end
