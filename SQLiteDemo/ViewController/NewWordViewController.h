//
//  NewWordViewController.h
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewWordViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) WordModel *selectedWord;

@property (weak, nonatomic) IBOutlet UITextField *japaneseWordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *vietnameseWordTextfield;
@property (weak, nonatomic) IBOutlet UITextView *exampleTextView;

@end
