//
//  Common.m
//  SQLiteDemo
//
//  Created by ThuyPH on 11/3/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (BOOL)validateEmail:(NSString *)strEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:strEmail];
}

@end
