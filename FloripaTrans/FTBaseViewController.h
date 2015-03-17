//
//  FTBaseViewController.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface FTBaseViewController : UIViewController
- (void)dismissKeyboard;
- (void)alertFailFetchingMessage:(NSString *)message;
- (void)alertMessage:(NSString *)message withTitle:(NSString *)title;
@end
