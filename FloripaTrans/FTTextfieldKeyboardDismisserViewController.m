//
//  TextfieldKeyboardDismisserViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTTextfieldKeyboardDismisserViewController.h"
@interface FTTextfieldKeyboardDismisserViewController() <UITextFieldDelegate>
@property (weak, nonatomic) UITextField *focusedTextField;
@end

@implementation FTTextfieldKeyboardDismisserViewController

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

@end
