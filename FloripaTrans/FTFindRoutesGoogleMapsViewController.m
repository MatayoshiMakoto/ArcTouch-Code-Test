//
//  FTFindRoutesGoogleMapsViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTFindRoutesGoogleMapsViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
#import "UIView+FTViewLayout.h"

CLLocationDegrees const kFlorianopolisLatitude  = -27.593500;
CLLocationDegrees const kFlorianopolisLongitude = -48.558540;

@interface  FTFindRoutesGoogleMapsViewController() <GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (strong, nonatomic) GMSMarker *routeMarker;

@property (weak, nonatomic) IBOutlet UIButton *okButton;

@end
@implementation FTFindRoutesGoogleMapsViewController

- (void)viewDidLoad {
    
    
    self.navigationItem.title = @"Map";
    
    // Set up the map view
    self.mapView.myLocationEnabled = NO;
    self.mapView.mapType = kGMSTypeNormal;
    self.mapView.settings.compassButton = YES;
    self.mapView.settings.myLocationButton = NO;
    
    self.mapView.delegate = self;
    
    // Round the corner of the search button
    [self.okButton roundViewCornerWithRadius:10];
    
    // Set up initial location for the map view
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:kFlorianopolisLatitude
                                                            longitude:kFlorianopolisLongitude
                                                                 zoom:14];
    self.mapView.camera = camera;
    
    // Instantiate the route marker
    self.routeMarker = [[GMSMarker alloc] init];
    
    // Change the back button so it has the title Back
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)okTouchUp:(id)sender {
    if(!self.routeMarker.map) {
        [self alertMessage:@"Choose a location" withTitle:@"Location Selection"];
        return;
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self reverseGeocodeCoordinate:self.routeMarker.position];
}


/**
 *  Method that check the content address based on a coordinate. If there's no error, the method calls a validation method to see if the address is a street or avenue.
 *
 *  @param coordinate coordinate
 */
- (void)reverseGeocodeCoordinate:(CLLocationCoordinate2D)coordinate {
    GMSGeocoder *geocoder = [GMSGeocoder geocoder];
    
    [geocoder reverseGeocodeCoordinate:coordinate completionHandler:^(GMSReverseGeocodeResponse *response, NSError *error) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        if(error) {
            [self alertMessage:[error localizedDescription] withTitle:@"Map Error"];
            
            return;
        }
        
        GMSAddress *address = [response firstResult];
        if(address){
           
            [self checkForValidStreet:address.thoroughfare];
         }
    }];
}

/**
 *  Check if the string is a street or an avenue. If it is valid, removes the AV. or R., call the delegate and pop the map view from the navigation stack. If it is not valid, it retrieves an erro message
 *
 *  @param string string which will be evaluated
 */
- (void) checkForValidStreet:(NSString *)string{
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(.*Av\\.\\s)|(.*R\\.\\s)" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string
                                                        options:0
                                                          range:NSMakeRange(0, [string length])];
    
    if (numberOfMatches > 0) {
        NSString *modifiedString = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
        
        if(self.delegate) {
            [self.delegate streetNameSelected:modifiedString];
        }
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else  {
        [self alertMessage:@"No Street or Avenue Found" withTitle:@"Could Not Find"];
    }
}

#pragma mark - GMSMapViewDelegate methods
- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    self.routeMarker.position = coordinate;
    self.routeMarker.title = @"Route";
    self.routeMarker.map = self.mapView;
}

@end
