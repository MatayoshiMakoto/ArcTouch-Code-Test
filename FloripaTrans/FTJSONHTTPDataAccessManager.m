//
//  FTJSONHTTPDataAccessManager.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTJSONHTTPDataAccessManager.h"
#import <AFNetworking.h>

@interface FTJSONHTTPDataAccessManager()
@property (strong, nonatomic) NSMutableDictionary *basePostBody;
@end

@implementation FTJSONHTTPDataAccessManager

/**
 *  Singleton accessor method.
 *
 *  @return returns the shared instance
 */
+ (instancetype)sharedManager {
    static FTJSONHTTPDataAccessManager *managerInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance = [[self alloc] initPrivate];
    });
    
    return managerInstance;
}

/**
 *  Overwrites the init method so that if for some reason there is an attempt
 *  to access it, it returns the shared instance.
 *
 *  @return returns the shared instance
 */
- (instancetype)init {
    return [[self class] sharedManager];
}

/**
 *  Singleton initializator.
 *
 *  @return returns the instance of JSONHTTPDataAccessManager with the default initizalition.
 */
- (instancetype) initPrivate {
    NSURL *baseEndPointUrl = [NSURL URLWithString: @"https://api.appglu.com/v1/queries/"];
    NSString *bAuthUsername = @"WKD4N7YMA1uiM8V";
    NSString *bAuthPassword = @"DtdTtzMLQlA0hk2C1Yi5pLyVIlAQ68";
    
    if(self = [super initWithBaseURL:baseEndPointUrl]) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [self.requestSerializer setAuthorizationHeaderFieldWithUsername:bAuthUsername password:bAuthPassword];
        [self.requestSerializer setValue:@"staging" forHTTPHeaderField:@"X-AppGlu-Environment"];
        
        self.basePostBody = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *postBodyContent = [[NSMutableDictionary alloc] init];
        [self.basePostBody setValue:postBodyContent forKey:@"params"];
    }
    
    return self;
}

/**
 *  Method which receive a string and remove accentuations.
 *
 *  @param string string which will be used.
 *
 *  @return string without accentuation.
 */
- (NSString *) formatStringForHTTP:(NSString *)string {
    
    NSData *stringASCIIData = [string dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    return [[NSString alloc] initWithData:stringASCIIData encoding:NSUTF8StringEncoding];
}

#pragma mark - Implementation of the FTDataAccessProtocol required Methods
- (void)findRoutesForStopName:(NSString *)stopName {
    NSMutableDictionary * postBody = self.basePostBody.mutableCopy;
    
    NSString *stopNameFormated = [NSString stringWithFormat:@"%%%@%%", [self formatStringForHTTP:stopName]];
    [postBody[@"params"] setValue:stopNameFormated forKey:@"stopName"];
    
    [self POST:@"findRoutesByStopName/run" parameters:postBody success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(didFindRoutes:forStopName:)]) {
            [self.delegate didFindRoutes:responseObject[@"rows"] forStopName:stopName];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(didFailToFindRoutesByStopName:)]) {
            [self.delegate didFailToFindRoutesByStopName:error];
        }
        
    }];
}

- (void)findStopsForRouteId:(int)routeId {
    
}

- (void) findDeparturesForRouteId:(int)routeId {
    
}

@end
