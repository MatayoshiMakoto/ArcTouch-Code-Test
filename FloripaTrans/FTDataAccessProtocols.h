//
//  FTDataAccessProtocols.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

@protocol FTDataAccessDelegate;

@protocol FTDataAccessManager <NSObject>

@required
/**
 *  Method to find routes for a specific stop name
 *
 *  @param stopName stop name
 */
- (void)findRoutesForStopName:(NSString *)stopName;

/**
 *  Method to find stops for a specific route id
 *
 *  @param routeId id of a route
 */
- (void)findStopsForRouteId:(int)routeId;

/**
 *  Method to find departures for a route id
 *
 *  @param routeId id of a route
 */
- (void)findDeparturesForRouteId:(int)routeId;

/**
 *  instace which will receive the DataAccessDelegate delegate methods
 */
@property (nonatomic, weak) id <FTDataAccessDelegate> delegate;

@end

@protocol FTDataAccessDelegate <NSObject>

@optional
/**
 *  Optional delegate method which retrieves all the routes for a specific stop
 *
 *  @param routes   array with all the routes
 *  @param stopName stop name which was used as reference to find the routes
 */
- (void)didFindRoutes:(NSArray *)routes forStopName:(NSString *)stopName;

/**
 *  Optional delegate method which retrieves an error if there was a problem while
 *  fetching the data of route by stop name
 *
 *  @param error error
 */
- (void)didFailToFindRoutesByStopName:(NSError *)error;


/**
 *  Optional delegate method which retrieves all the stops for a specific route id
 *
 *  @param stops  array with all the stops
 *  @param routeId route id which was used as reference to find the stops
 */
- (void)didFindStops:(NSArray *)stops forRoutesId:(int)routeId;

/**
 *  Optional delegate method which retrieves an error if there was a problem while
 *  fetching the data for stops by route id
 *
 *  @param error error
 */
- (void)didFailToFindStopsForRoutesId:(NSError *)error;

/**
 *  Optional delegate method which retrieves all the departures fo a specific route id
 *
 *  @param departures array with all the departures
 *  @param routeId    route id which was used as reference to find the stops
 */
- (void)didFindDepartures:(NSArray *)departures ByRouteId:(int)routeId;

/**
 *  Optional delegate method which retrieves an eror if there was a problem while
 *  fetching the data for departures for route id
 *
 *  @param error error
 */
- (void)didFailToFindDeparturesForRouteId:(NSError *)error;
@end
