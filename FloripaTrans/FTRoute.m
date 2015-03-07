//
//  FTRoute.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRoute.h"

@implementation FTRoute

/**
 *  Method that initializes a FTRoute object setting it's agencyId, id, last modified date, long name and short name properties.
 *
 *  @param agencyId         agencyId
 *  @param identifier       unique Id
 *  @param lastModifiedDate last time this object was modified
 *  @param longName         it's string name
 *  @param shortName        it's short name
 *
 *  @return returns an instance of the FTRoute
 */
- (instancetype)initWithAgencyId:(NSString *)agencyId
                           andId:(NSString *)identifier
             andLastModifiedDate:(NSString *)lastModifiedDate
                     andLongName:(NSString *)longName
                     andShorName:(NSString *)shortName {
    if(self = [super init])
    {
        self.agencyId   = [agencyId intValue];
        self.identifier = [identifier intValue];
        self.longName   = longName;
        self.shortName  = [shortName intValue];

        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
        self.lastModifiedDate = [dateFormatter dateFromString:lastModifiedDate];
    }
    
    return self;
}

/**
 *  Class method that allocates and initializes a FTRoute object setting it's agencyId, id, last modified date, long name and short name properties.
 *
 *  @param agencyId         agencyId
 *  @param identifier       unique Id
 *  @param lastModifiedDate last time this object was modified
 *  @param longName         it's string name
 *  @param shortName        it's short name
 *
 *  @return returns an instance of the FTRoute already allocated
 */
+ (instancetype)routeWithAgencyId:(NSString *)agencyId
                            andId:(NSString *)identifier
              andLastModifiedDate:(NSString *)lastModifiedDate
                      andLongName:(NSString *)longName
                      andShorName:(NSString *)shortName {
    
    FTRoute *newRoute = [[FTRoute alloc] initWithAgencyId:agencyId
                                                andId:identifier
                                  andLastModifiedDate:lastModifiedDate
                                          andLongName:longName
                                          andShorName:shortName];
    
    return newRoute;
}

/**
 *  Method that returns a string with all of a FTRoute's instance properties.
 *
 *  @return string with all properties current values.
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"\r{\ragencyId = %d\rid = %d\rlastModifiedDate = %@\rlongName = %@\rshortName = %d\r}", self.agencyId, self.identifier, self.lastModifiedDate, self.longName, self.shortName];
}
@end
