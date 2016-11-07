//
//  WordModel.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/7/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordModel : NSObject

@property (nonatomic) NSInteger wordId;
@property (nonatomic) NSInteger userId;
@property (nonatomic, strong) NSString *japanese;
@property (nonatomic, strong) NSString *vietnamese;
@property (nonatomic, strong) NSString *example;
@property (nonatomic) NSInteger type;

- (id)initWithDict:(NSDictionary*)dict;

@end
