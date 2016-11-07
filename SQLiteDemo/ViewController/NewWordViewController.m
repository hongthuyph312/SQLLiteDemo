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
    
    [self setSelectedButton:[self.view viewWithTag:100]];
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
    NSInteger type;
    for (int i = 100; i<105; i++) {
        UIButton *btn = [self.view viewWithTag:i];
        if (btn.selected) {
            type = i - 100;
            break;
        }
    }
    BOOL isSuccess = [DatabaseModel saveWord:0 andJapaneseString:_japaneseWordTextfield.text andVietNameseText:_vietnameseWordTextfield.text andType:type andExample:_exampleTextView.text withUserId:appdelegate.currentUser.userId];
    if (isSuccess) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    
}
- (IBAction)selectTypeAction:(id)sender {
    [self setSelectedButton:sender];
}

- (void) setSelectedButton:(UIButton *)button{
    button.selected = YES;
    button.backgroundColor = [UIColor colorWithRed:131/255.0f green:158/255.0f blue:27/255.0f alpha:1];
    for (int i = 100; i < 105; i++) {
        if (i != [button tag]) {
            UIButton *btn = (UIButton *)[self.view viewWithTag:i];
            btn.selected = NO;
            btn.backgroundColor = [UIColor lightGrayColor];
        }
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
