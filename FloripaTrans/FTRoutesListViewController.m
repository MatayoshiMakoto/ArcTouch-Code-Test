//
//  FTRoutesListViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRoutesListViewController.h"
#import "FTDataAccessProtocols.h"

@interface FTRoutesListViewController() <UITableViewDelegate, UITableViewDataSource, FTDataAccessDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton    *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *routesTableView;

@property (strong, nonatomic) NSArray     *routes;

@property (strong, nonatomic) id <FTDataAccessManager> dataAccessManager;

@end

@implementation FTRoutesListViewController


- (IBAction)searchTouchUp:(id)sender {
    
    [self dismissKeyboard];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.routes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return nil;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
