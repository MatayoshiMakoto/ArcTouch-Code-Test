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

NSString * const kDetailViewTitle                 = @"Route Detail";
NSString * const kDetailNavigationBackButtonTitle = @"Back";

@interface FTRouteDetailViewController() <FTDataAccessDelegate, FTRouteDetailTableViewDelegateHandlerDelegate>
@property (weak, nonatomic) IBOutlet UIView      *titleBackground;
@property (weak, nonatomic) IBOutlet UILabel     *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@property (strong, nonatomic) id <FTDataAccessManager> dataAccessManager;

@property (strong, nonatomic) FTRouteDetailTableViewDelegateHandler *tableViewDelegateHandler;
@end

@implementation FTRouteDetailViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = kDetailViewTitle;
    
    // Set up how the UI state of the UI elements
    [self.titleBackground roundViewCornerWithRadius:25];
    self.titleLabel.text = self.route.longName;
    
    // Change the back button so it has the title Back
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:kDetailNavigationBackButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = item;
    
    // Set the content table view data source to the table view delegate handler
    self.tableViewDelegateHandler = [[FTRouteDetailTableViewDelegateHandler alloc] init];
    self.contentTableView.delegate = self.tableViewDelegateHandler;
    self.contentTableView.dataSource = self.tableViewDelegateHandler;
    self.tableViewDelegateHandler.delegate = self;
    
    
    // Set up the data access manager
    self.dataAccessManager = [FTJSONHTTPDataAccessManager sharedManager];
    self.dataAccessManager.delegate = self;
    [self.dataAccessManager findStopsForRouteId:self.route.identifier];

}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)goBack {
    [self.dataAccessManager cancelAllFetchingRequest];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - DataAccessDelegate delegate methods
- (void)didFindStops:(NSArray *)stops forRoutesId:(int)routeId {
    [self.tableViewDelegateHandler updateStreets:stops];
    
    self.dataAccessManager.delegate = self;
    [self.dataAccessManager findDeparturesForRouteId:self.route.identifier];
}

- (void)didFailToFindStopsForRoutesId:(NSError *)error {
    [self alertFailFetchingMessage:[error localizedDescription]];
}

- (void)didFindDepartures:(NSArray *)departures ByRouteId:(int)routeId {
    [self.tableViewDelegateHandler updateDepartures:departures];
    
}

- (void)didFailToFindDeparturesForRouteId:(NSError *)error {
    [self alertFailFetchingMessage:[error localizedDescription]];
}

#pragma mark - FTRouteDetailTableViewDelegateHandlerDelegate delgate methods

- (void)refreshTableViewSection:(NSInteger)section {
    [self.contentTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)reloadTableView {
    [self.contentTableView reloadData];
}


@end
