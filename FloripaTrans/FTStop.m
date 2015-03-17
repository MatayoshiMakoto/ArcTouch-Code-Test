//
//  FTStop.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTStop.h"

@implementation FTStop

/**
 *  Method that initializes a FTStop object setting it's id, name, routeId and sequence properties.
 *
 *  @param identifier unique Id
 *  @param name       name of the stop
 *  @param routeId    route used to search for it
 *  @param sequence   it's sequence in the chosen route
 *
 *  @return returns an instance of the FTStop
 */
- (instancetype)initWithId:(NSString *)identifier
                   andName:(NSString *)name
                andRouteId:(NSString *)routeId
               andSequence:(NSString *)sequence {
    
    if(self = [super init])
    {
        self.identifier = [identifier intValue];
        self.name   = name;
        self.routeId  = [routeId intValue];
        self.sequence = [sequence intValue];
        
    }
    
    return self;
}

/**
 *  Class method that allocates and initializes a FTStop object setting it's id, name, routeId and sequence properties.
 *
 *  @param identifier unique Id
 *  @param name       name of the stop
 *  @param routeId    route used to search for it
 *  @param sequence   it's sequence in the chosen route
 *
 *  @return returns an instance of the FTStop already allocated
 */
+ (instancetype)stopWithId:(NSString *)identifier
                   andName:(NSString *)name
                andRouteId:(NSString *)routeId
               andSequence:(NSString *)sequence {
    
    FTStop *newStop = [[FTStop alloc] initWithId:identifier
                                         andName:name
                                      andRouteId:routeId
                                     andSequence:sequence];
    
    return newStop;
}

/**
 *  Method that returns a string with all of a FTStop's instance properties.
 *
 *  @return string with all properties current values.
 */
#define kDescriptionStringFormat @"\r{\rid = %d\rname = %@\routeId = %d\rsequence = %d\r}"
- (NSString *)description {
    return [NSString stringWithFormat:kDescriptionStringFormat, self.identifier, self.name, self.routeId, self.sequence];
}
@end
