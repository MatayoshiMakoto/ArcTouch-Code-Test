//
//  FTBaseViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//
#import "FTBaseViewController.h"

NSString * const kFetchingDataErrorAlertMessageTitle = @"Fetching Data Error";
NSString * const kCancelAlertMessageButton = @"Ok";

@interface FTBaseViewController() <UITextFieldDelegate>
@property (weak, nonatomic) UITextField *focusedTextField;
@end

@implementation FTBaseViewController

#pragma mark - Dismiss Keyboard
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.focusedTextField = textField;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismissKeyboard];
}

- (void) dismissKeyboard {
    if(self.focusedTextField)
    {
        [self.focusedTextField resignFirstResponder];
        self.focusedTextField = nil;
    }
}

- (void)alertFailFetchingMessage:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:kFetchingDataErrorAlertMessageTitle
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:kCancelAlertMessageButton
                                              otherButtonTitles:nil];
    [alertView show];
}

- (void)alertMessage:(NSString *)message withTitle:(NSString *)title {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:kCancelAlertMessageButton
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
