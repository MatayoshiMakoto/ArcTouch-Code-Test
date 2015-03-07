//
//  FTRouteDetailViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRouteDetailViewController.h"
#import "FTDataAccessProtocols.h"
#import "FTJSONHTTPDataAccessManager.h"
#import "FTRoute.h"
#import "UIView+FTViewLayout.h"
#import "FTRouteDetailTableViewDelegateHandler.h"

@interface FTRouteDetailViewController() <FTDataAccessDelegate>
@property (weak, nonatomic) IBOutlet UIView      *titleBackground;
@property (weak, nonatomic) IBOutlet UILabel     *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@property (strong, nonatomic) id <FTDataAccessManager> dataAccessManager;

@property (strong, nonatomic) FTRouteDetailTableViewDelegateHandler *tableViewDelegateHandler;
@end

@implementation FTRouteDetailViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"%@", self.route);
    
    // Set up how the UI state of the UI elements
    [self.titleBackground roundViewCornerWithRadius:25];
    self.titleLabel.text = self.route.longName;
    
    // Change the back button so it has the title Back
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = item;
    
    // Set the content table view data source to the table view delegate handler
    self.tableViewDelegateHandler = [[FTRouteDetailTableViewDelegateHandler alloc] init];
    self.contentTableView.delegate = self.tableViewDelegateHandler;
    self.contentTableView.dataSource = self.tableViewDelegateHandler;
    
    // Set up the data access manager
    self.dataAccessManager = [FTJSONHTTPDataAccessManager sharedManager];
    self.dataAccessManager.delegate = self;
    [self.dataAccessManager findStopsForRouteId:self.route.identifier];

}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - DataAccessDelegate delegate methods
- (void)didFindStops:(NSArray *)stops forRoutesId:(int)routeId {
    NSLog(@"%@", stops);
    self.dataAccessManager.delegate = self;
    [self.dataAccessManager findDeparturesForRouteId:self.route.identifier];
}

- (void)didFailToFindStopsForRoutesId:(NSError *)error {
    [self alertFailFetchingMessage:[error localizedDescription]];
}

- (void)didFindDepartures:(NSArray *)departures ByRouteId:(int)routeId {
    NSLog(@"%@", departures);
    
}

- (void)didFailToFindDeparturesForRouteId:(NSError *)error {
    [self alertFailFetchingMessage:[error localizedDescription]];
}





@end
