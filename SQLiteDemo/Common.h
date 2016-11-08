//
//  Common.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/3/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Common : NSObject

+ (BOOL)validateEmail:(NSString *)strEmail;
+ (CGFloat)heightForViewWithText:(NSString *)text andFont:(UIFont *)font andSizeWidth:(CGFloat)width;
@end
