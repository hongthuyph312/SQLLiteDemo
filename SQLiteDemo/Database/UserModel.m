//
//  UserModel.m
//  SQLiteDemo
//
//  Created by ThuyPH on 11/7/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        if ([dict objectForKey:@"userId"]) {
            self.userId = [[dict objectForKey:@"userId"] integerValue];
        }
        if ([dict objectForKey:@"email"]) {
            self.email = [dict objectForKey:@"email"];
        }
        if ([dict objectForKey:@"password"]) {
            self.password = [dict objectForKey:@"password"];
        }
    }
    return self;
}
@end
