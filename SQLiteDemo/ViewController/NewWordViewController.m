//
//  NewWordViewController.m
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "NewWordViewController.h"

@interface NewWordViewController ()
{
    AppDelegate *appdelegate;
}

@end

@implementation NewWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapOther = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tapOther];
    
    if (_selectedWord) {
        // edit
        _japaneseWordTextfield.text = _selectedWord.japanese;
        _vietnameseWordTextfield.text = _selectedWord.vietnamese;
        _exampleTextView.text = _selectedWord.example;
        [_addButton setTitle:@"Save" forState:UIControlStateNormal];
        self.navigationItem.title = @"Edit Word";
    } else {
        [_addButton setTitle:@"Add" forState:UIControlStateNormal];
        self.navigationItem.title = @"New Word";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButton_clicked:(id)sender {
    [self.view endEditing:YES];
    [_japaneseWordTextfield resignFirstResponder];
    [_vietnameseWordTextfield resignFirstResponder];
    [_exampleTextView resignFirstResponder];
    UIAlertView *alert;
    if (_japaneseWordTextfield.text.length == 0) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter Japanese text" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if (_japaneseWordTextfield.text.length == 0) {
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter Vietnamese text" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    NSInteger wordId = 0;
    if (_selectedWord) {
        wordId = _selectedWord.wordId;
    }
    BOOL isSuccess = [DatabaseModel saveWord:wordId andJapaneseString:_japaneseWordTextfield.text andVietNameseText:_vietnameseWordTextfield.text andExample:_exampleTextView.text withUserId:appdelegate.currentUser.userId];
    if (isSuccess) {
        NSInteger index;
        if (self.selectedWord) {
            index = self.navigationController.viewControllers.count - 3;
        } else {
            index = self.navigationController.viewControllers.count - 2;
        }
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index] animated:YES];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    
}

#pragma mark TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

#pragma mark DismissKeyboard
- (void) dismissKeyboard:(id) sender{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
