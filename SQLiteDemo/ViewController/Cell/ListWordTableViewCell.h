//
//  ListWordTableViewCell.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/8/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordModel.h"

@interface ListWordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *japaneseLabel;
@property (weak, nonatomic) IBOutlet UILabel *vietnameseLabel;
- (void)setupCell:(WordModel *) wordModel;
+ (CGFloat)heightForCell:(WordModel *) wordModel;

@end
