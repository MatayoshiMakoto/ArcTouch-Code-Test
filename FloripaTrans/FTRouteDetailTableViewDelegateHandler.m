//
//  FTRouteDetailTableViewDelegateHandler.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRouteDetailTableViewDelegateHandler.h"
#import "FTDeparture.h"
#import "FTStop.h"


@interface FTRouteDetailTableViewDelegateHandler()
@property (strong, nonatomic) NSArray *streets;

@property (strong, nonatomic) NSMutableArray *weekdayDepartures;
@property (strong, nonatomic) NSMutableArray *saturdayDepartures;
@property (strong, nonatomic) NSMutableArray *sundayDepartures;
@end

@implementation FTRouteDetailTableViewDelegateHandler

- (instancetype)init {
    
    if(self = [super init])
    {
        self.streets = [NSArray array];
        
        self.weekdayDepartures  = [NSMutableArray array];
        self.saturdayDepartures = [NSMutableArray array];
        self.sundayDepartures   = [NSMutableArray array];
    }
    
    return self;
}

/**
 *  Method that updates the streets for the streets array data source and refresh the tableview
 *
 *  @param streets streets
 */
- (void)updateStreets:(NSArray *)streets {
    self.streets = streets;
    if(self.delegate && [self.delegate respondsToSelector:@selector(refreshTableViewSection:)]) {
        [self.delegate refreshTableViewSection:0];
    }
}

/**
 *  Method that updates the departures arrays data source and refresh the tableview
 *
 *  @param departures departures
 */
- (void)updateDepartures:(NSArray *)departures {
    
    self.weekdayDepartures  = [NSMutableArray array];
    self.saturdayDepartures = [NSMutableArray array];
    self.sundayDepartures   = [NSMutableArray array];
    
    for(FTDeparture *d in departures) {
        if(d.calendar == WEEKDAY){
            [self.weekdayDepartures addObject:d];
        } else if(d.calendar == SATURDAY) {
            [self.saturdayDepartures addObject:d];
        } else if(d.calendar == SUNDAY) {
            [self.sundayDepartures addObject:d];
        }
    }
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(reloadTableView)]) {
        [self.delegate reloadTableView];
    }
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int value = 0;
    
    if([self.streets count] > 0) {
        value++;
    }
    
    if([self.weekdayDepartures count] > 0) {
        value++;
    }
    
    if([self.saturdayDepartures count] > 0) {
        value++;
    }
    
    if([self.sundayDepartures count] > 0) {
        value++;
    }
    
    if(value == 0) {
        return 1;
    }
    
    return value;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0 && [self.streets count] > 0)
        return [self.streets count] + 1;
    
    Calendar sectionType = [self sectionTypeForSection:section];
    
    if(sectionType == WEEKDAY) {
        return [self.weekdayDepartures count] + 1;
    } else if(sectionType == SATURDAY) {
        return [self.saturdayDepartures count] + 1;
    } else if(sectionType == SUNDAY) {
        return [self.sundayDepartures count] + 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *routeDetailTableIdentifier = @"routeDetailTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:routeDetailTableIdentifier ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:routeDetailTableIdentifier ];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    Calendar sectionType = [self sectionTypeForSection:indexPath.section];
    
    if(indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self configureHeaderCell:cell title:@"Streets"];
        } else{
            [self configureStreeCell:cell forStreet:self.streets[indexPath.row - 1]];
        }
    } else if(sectionType == WEEKDAY) {
        
        if (indexPath.row == 0) {
            [self configureHeaderCell:cell title:@"Weekday"];
        } else {
            [self configureDeparturesCell:cell forDeparture:self.weekdayDepartures[indexPath.row -1]];
        }
    } else if(sectionType == SATURDAY) {
        if (indexPath.row == 0) {
            [self configureHeaderCell:cell title:@"Saturday"];
        } else {
            [self configureDeparturesCell:cell forDeparture:self.saturdayDepartures[indexPath.row -1]];
        }
    } else if(sectionType == SUNDAY) {
        if (indexPath.row == 0) {
            [self configureHeaderCell:cell title:@"Sunday"];
        } else {
            [self configureDeparturesCell:cell forDeparture:self.sundayDepartures[indexPath.row -1]];
        }
    }
    
    return cell;
}

- (void)configureHeaderCell:(UITableViewCell *)cell title:(NSString *)title {
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = @"";
    cell.imageView.image = nil;
}

- (void)configureStreeCell:(UITableViewCell *)cell forStreet:(FTStop *)street {
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    cell.textLabel.text =  street.name;
    cell.detailTextLabel.text = @"";
    cell.imageView.image = nil;
}

- (void)configureDeparturesCell:(UITableViewCell *)cell forDeparture:(FTDeparture *)departure {
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
    cell.detailTextLabel.text = @"";
    cell.textLabel.text = departure.time;
}


/**
 *  Method that based on a section returns a specific calendar based on the current values of the calendars departures arrays.
 *
 *  @param section section
 *
 *  @return returns a calendar related to the section
 */
- (Calendar) sectionTypeForSection:(NSInteger)section {
    switch (section) {
        case 1: {
            if([self.weekdayDepartures count] > 0)
            {
                return WEEKDAY;
            }else if([self.saturdayDepartures count] > 0) {
                return SATURDAY;
            }else if([self.sundayDepartures count] > 0) {
                return SUNDAY;
            }else {
                return INVALID;
            }
        }
            
        case 2: {
            if([self.saturdayDepartures count] > 0) {
                return SATURDAY;
            }else if([self.sundayDepartures count] > 0) {
                return SUNDAY;
            }else {
                return INVALID;
            }
        }
            
        case 3: {
            if([self.sundayDepartures count] > 0) {
                return SUNDAY;
                
            }else {
                return INVALID;
            }
        }
        default: {
            return INVALID;
        }
    }
}
@end
