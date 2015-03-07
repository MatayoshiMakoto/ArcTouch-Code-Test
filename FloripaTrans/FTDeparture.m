//
//  FTDeparture.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTDeparture.h"

@implementation FTDeparture

/**
 *  Method that initializes a FTDeparture object setting it's calendar, id, and time properties.
 *
 *  @param calendar   calendar in which the departure happens
 *  @param identifier unique Id
 *  @param time       time which it departs
 *
 *  @return returns an instance of the FTDeparture
 */
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

/**
 *  Class method that allocates and initializes a FTDeparture object setting it's calendar, id, and time properties.
 *
 *  @param calendar   calendar in which the departure happens
 *  @param identifier unique Id
 *  @param time       time which it departs
 *
 *  @return returns an instance of the FTDeparture already allocated
 */

- (instancetype)departureWithCalendar:(NSString *)calendar
                                andId:(NSString *)identifier
                              andTime:(NSString *)time {
    
    FTDeparture *newDeparture = [[FTDeparture alloc] initWithCalendar:calendar
                                                                andId:identifier
                                                              andTime:time];
    
    return newDeparture;
}

/**
 *  Method that converts a string to a Calendar enum
 *
 *  @param calendarString string to be converted
 *
 *  @return returns a Calendar enum
 */
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

/**
 *  Method that returns a string with all of a FTDeparture's instance properties.
 *
 *  @return string with all properties current values.
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"\r{\rcalendar = %ld\rnid = %d\time = %@\r}", self.calendar, self.identifier, self.time];
}
@end
