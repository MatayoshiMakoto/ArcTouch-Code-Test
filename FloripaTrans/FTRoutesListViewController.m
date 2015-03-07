//
//  FTRoutesListViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRoutesListViewController.h"

@interface FTRoutesListViewController()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton    *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *routesTableView;

@property (strong, nonatomic) NSArray     *routes;
@end

@implementation FTRoutesListViewController


- (IBAction)searchTouchUp:(id)sender {
    
    [self dismissKeyboard];
}
@end
