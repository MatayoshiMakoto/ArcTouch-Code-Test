//
//  FTRoutesListViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRoutesListViewController.h"
#import "FTDataAccessProtocols.h"
#import "FTJSONHTTPDataAccessManager.h"
#import "UIView+FTViewLayout.h"
#import "FTRoute.h"
#import "FTRouteDetailViewController.h"
#import "FTFindRoutesGoogleMapsViewController.h"

@interface FTRoutesListViewController() <UITableViewDelegate, UITableViewDataSource, FTDataAccessDelegate, FTFindRoutesGoogleMapsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton    *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *routesTableView;

@property (strong, nonatomic) NSArray *routes;
@property (strong, nonatomic) FTRoute *selectedRoute;

@property (strong, nonatomic) id <FTDataAccessManager> dataAccessManager;

@end

@implementation FTRoutesListViewController

- (void)viewDidLoad {
    // Set up view title
    self.navigationItem.title = @"Routes";
    
    // Round the corner of the search button
    [self.searchButton roundViewCornerWithRadius:10];
    
    // Set up the data access manager
    self.dataAccessManager = [FTJSONHTTPDataAccessManager sharedManager];
    self.dataAccessManager.delegate = self;
    [self.dataAccessManager findRoutesForStopName:@"Deputado Antônio Edu Vieira"];
    
    // Add a map button
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:self action:@selector(goToMap)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.dataAccessManager cancelAllFetchingRequest];
}

- (void) goToMap {
    [self performSegueWithIdentifier:@"PushToMap" sender:self];
}

- (IBAction)searchTouchUp:(id)sender {
    NSString * searchText = self.searchTextField.text;
    if(searchText && searchText.length > 0)
    {
        self.dataAccessManager.delegate = self;
        [self.dataAccessManager findRoutesForStopName:searchText];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No Content"
                                                            message:@"Type a stop name to search"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
    [self dismissKeyboard];
}

#pragma mark - FtFindRoutesGoogleMapsViewController delegate methods

- (void)streetNameSelected:(NSString *)street {
    self.dataAccessManager.delegate = self;
    [self.dataAccessManager findRoutesForStopName:street];
    self.searchTextField.text = street;
}

#pragma mark - DataAccessDelegate delegate methods

- (void)didFindRoutes:(NSArray *)routes forStopName:(NSString *)stopName {
    
    self.routes = routes;
    [self.routesTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didFailToFindRoutesByStopName:(NSError *)error {
    [self alertFailFetchingMessage:[error localizedDescription]];
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
    static NSString *simpleTableIdentifier = @"routesTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    FTRoute *currentRoute = [self.routes objectAtIndex:indexPath.row];
    cell.textLabel.text = currentRoute.longName;
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.routesTableView)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.selectedRoute = self.routes[indexPath.row];
        [self performSegueWithIdentifier:@"PushToRouteDetail" sender:self];
    }

}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"PushToRouteDetail"]) {
        FTRouteDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.route = self.selectedRoute;
    } else if([[segue identifier] isEqualToString:@"PushToMap"]) {
        FTFindRoutesGoogleMapsViewController *mapViewController = [segue destinationViewController];
        mapViewController.delegate = self;
    }
}


@end
