//
//  FTRoute.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTRoute : NSObject
@property (assign, nonatomic) int      agencyId;
@property (assign, nonatomic) int      identifier;
@property (strong, nonatomic) NSDate   *lastModifiedDate;
@property (copy, nonatomic  ) NSString *longName;
@property (assign, nonatomic) int      shortName;

- (instancetype)initWithAgencyId:(NSString *)agencyId
                           andId:(NSString *)identifier
             andLastModifiedDate:(NSString *)lastModifiedDate
                     andLongName:(NSString *)longName
                     andShorName:(NSString *)shortName;

+ (instancetype)routeWithAgencyId:(NSString *)agencyId
                            andId:(NSString *)identifier
              andLastModifiedDate:(NSString *)lastModifiedDate
                      andLongName:(NSString *)longName
                      andShorName:(NSString *)shortName;
@end
