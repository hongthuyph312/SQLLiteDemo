//
//  AppDelegate.h
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UserModel *currentUser;

@end

