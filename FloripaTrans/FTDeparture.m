//
//  FTDeparture.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTDeparture.h"

@implementation FTDeparture

- (instancetype)initWithCalendar:(NSString *)calendar
                           andId:(NSString *)identifier
                         andTime:(NSString *)time {
    
    if(self = [super init])
    {
        self.identifier = [identifier intValue];
        self.time   = time;
        self.calendar = [self stringToCalendar:calendar];
        
    }
    
    return self;
}

- (instancetype)departureWithCalendar:(NSString *)calendar
                                andId:(NSString *)identifier
                              andTime:(NSString *)time {
    
    FTDeparture *newDeparture = [[FTDeparture alloc] initWithCalendar:calendar
                                                                andId:identifier
                                                              andTime:time];
    
    return newDeparture;
}

- (Calendar) stringToCalendar:(NSString *)calendarString {
    
    if([calendarString isEqualToString:@"WEEKDAY"]) {
        return WEEKDAY;
    } else if([calendarString isEqualToString:@"SATURDAY"]) {
        return SATURDAY;
    } else if([calendarString isEqualToString:@"SUNDAY"]) {
        return SUNDAY;
    }
    
    return INVALID;
}
@end
