//
//  UserModel.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/7/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic) NSInteger userId;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

- (id) initWithDict:(NSDictionary *)dict;

@end
