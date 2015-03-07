//
//  FTStop.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTStop : NSObject
@property (assign, nonatomic) int identifier;
@property (copy, nonatomic  ) NSString *name;
@property (assign, nonatomic) int      routeId;
@property (assign, nonatomic) int      sequence;

- (instancetype)initWithId:(NSString *)identifier
                   andName:(NSString *)name
                andRouteId:(NSString *)routeId
               andSequence:(NSString *)sequence;

+ (instancetype) stopWithId:(NSString *)identifier
                    andName:(NSString *)name
                 andRouteId:(NSString *)routeId
                andSequence:(NSString *)sequence;
@end
