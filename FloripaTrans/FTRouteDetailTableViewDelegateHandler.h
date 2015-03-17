//
//  FTRouteDetailTableViewDelegateHandler.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UITableView;

@protocol FTRouteDetailTableViewDelegateHandlerDelegate <NSObject>

@required
- (void)refreshTableViewSection:(NSInteger) section;
- (void)reloadTableView;
@end

@interface FTRouteDetailTableViewDelegateHandler : NSObject <UITableViewDataSource, UITableViewDelegate>

- (void)updateStreets:(NSArray *)streets;
- (void)updateDepartures:(NSArray *)departures;

@property (nonatomic, weak) id <FTRouteDetailTableViewDelegateHandlerDelegate> delegate;
@end
