//
//  FTFindRoutesGoogleMapsViewController.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTBaseViewController.h"
@protocol FTFindRoutesGoogleMapsViewControllerDelegate <NSObject>
@required
- (void)streetNameSelected:(NSString *)street;
@end

@interface FTFindRoutesGoogleMapsViewController : FTBaseViewController

@property (nonatomic, weak) id <FTFindRoutesGoogleMapsViewControllerDelegate> delegate;
@end
