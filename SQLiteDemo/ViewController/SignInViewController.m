//
//  ViewController.m
//  SQLLiteDemo
//
//  Created by ThuyPH on 11/2/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "SignInViewController.h"
#import "ListWordViewController.h"
#import "UserModel.h"
#import "AppDelegate.h"

@interface SignInViewController ()
{
    AppDelegate *appdelegate;
}

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button clicked
- (IBAction)signInButton_clicked:(id)sender {
    [self.view endEditing:YES];
    [_emailTextfield resignFirstResponder];
    [_passwordTextfield resignFirstResponder];
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
    NSArray *arrData = [DatabaseModel loginWithUser:_emailTextfield.text andPassword:_passwordTextfield.text];
    if (arrData.count > 0) {
        appdelegate.currentUser = [arrData objectAtIndex:0];
        [self performSegueWithIdentifier:@"pushToListWord" sender:self];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Email or password is wrong" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
- (IBAction)signUpButton_clicked:(id)sender {
}


#pragma mark TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"pushToListWord"]) {
        ListWordViewController *listWordVC = (ListWordViewController *)[segue destinationViewController];
    }
}


@end
