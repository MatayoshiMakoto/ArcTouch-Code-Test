//
//  FTRouteDetailViewController.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTTextfieldKeyboardDismisserViewController.h"
@class FTRoute;

@interface FTRouteDetailViewController : FTTextfieldKeyboardDismisserViewController
@property (strong, nonatomic) FTRoute *route;
@end
