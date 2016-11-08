//
//  DetailViewController.h
//  SQLiteDemo
//
//  Created by ThuyPH on 11/8/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordModel.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) WordModel *selectedWord;

@property (weak, nonatomic) IBOutlet UILabel *japaneseLabel;
@property (weak, nonatomic) IBOutlet UILabel *vietnameseLabel;
@property (weak, nonatomic) IBOutlet UITextView *exampleTextView;

@end
