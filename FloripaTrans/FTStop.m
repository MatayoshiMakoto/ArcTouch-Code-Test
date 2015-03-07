//
//  FTStop.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTStop.h"

@implementation FTStop

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
@end
