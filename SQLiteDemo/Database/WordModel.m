//
//  WordModel.m
//  SQLiteDemo
//
//  Created by ThuyPH on 11/7/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "WordModel.h"

@implementation WordModel

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        if ([dict objectForKey:@"wordId"]) {
            self.wordId = [[dict objectForKey:@"wordId"] integerValue];
        }
        if ([dict objectForKey:@"userId"]) {
            self.userId = [[dict objectForKey:@"userId"] integerValue];
        }
        if ([dict objectForKey:@"japanese"]) {
            self.japanese = [dict objectForKey:@"japanese"];
        }
        if ([dict objectForKey:@"vietnamese"]) {
            self.vietnamese = [dict objectForKey:@"vietnamese"];
        }
        if ([dict objectForKey:@"example"]) {
            self.example = [dict objectForKey:@"example"];
        }
    }
    return self;
}

@end
