//
//  ListBookViewController.h
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListWordViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listWordTableView;

@end
