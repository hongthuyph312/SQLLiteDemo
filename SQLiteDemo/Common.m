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

+ (CGFloat)heightForViewWithText:(NSString *)text andFont:(UIFont *)font andSizeWidth:(CGFloat)width
{
    if (!font) {
        font = [UIFont systemFontOfSize:14.0];
    }
    CGSize sizeToFit = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{ NSFontAttributeName:font }
                                          context:nil].size;
    return sizeToFit.height + 1;
}


@end
