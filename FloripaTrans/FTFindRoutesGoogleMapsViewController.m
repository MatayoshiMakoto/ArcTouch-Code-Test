//
//  FTFindRoutesGoogleMapsViewController.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTFindRoutesGoogleMapsViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface  FTFindRoutesGoogleMapsViewController() <GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end
@implementation FTFindRoutesGoogleMapsViewController

- (void)viewDidLoad {
    
    self.mapView.myLocationEnabled = YES;
    self.mapView.mapType = kGMSTypeNormal;
    self.mapView.settings.compassButton = YES;
    self.mapView.settings.myLocationButton = YES;
    
    self.mapView.delegate = self;
    
}
@end
