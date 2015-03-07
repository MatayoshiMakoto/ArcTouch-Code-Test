//
//  FTDeparture.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Calendar) {
    WEEKDAY = 0,
    SATURDAY,
    SUNDAY,
    INVALID
};

@interface FTDeparture : NSObject
@property (assign, nonatomic) Calendar calendar;
@property (assign, nonatomic) int      identifier;
@property (copy, nonatomic) NSString *time;

- (instancetype)initWithCalendar:(NSString *)calendar
                           andId:(NSString *)identifier
                         andTime:(NSString *)time;

+ (instancetype)departureWithCalendar:(NSString *)calendar
                                andId:(NSString *)identifier
                              andTime:(NSString *)time;
@end
