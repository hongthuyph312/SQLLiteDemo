//
//  SignUpViewController.m
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpButton_clicked:(id)sender {
    [self.view endEditing:YES];
    [_emailTextfield resignFirstResponder];
    [_passwordTextfield resignFirstResponder];
    [_rePasswordTextfield resignFirstResponder];
    if (![Common validateEmail:_emailTextfield.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Email is invalid!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if (_passwordTextfield.text.length < 8) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Password at least 8 characters!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if (![_passwordTextfield.text isEqualToString:_rePasswordTextfield.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Password not match!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    // add new user to database
    
}

#pragma mark TextFieldDelegate
- (BOOL)resignFirstResponder{
    return YES;
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
