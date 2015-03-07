//
//  FTRouteDetailTableViewDelegateHandler.m
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/7/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "FTRouteDetailTableViewDelegateHandler.h"


@interface FTRouteDetailTableViewDelegateHandler()

@end

@implementation FTRouteDetailTableViewDelegateHandler

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return nil;
}

- (void)configureHeaderCell:(UITableViewCell *)cell title:(NSString *)title {
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = @"";
    cell.imageView.image = nil;
}

- (void)configureStreeCell:(UITableViewCell *)cell forStreet:(NSDictionary *)street {
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    cell.textLabel.text =  street[@"name"];
    cell.detailTextLabel.text = @"";
    cell.imageView.image = nil;
}

- (void)configureDeparturesCell:(UITableViewCell *)cell forDeparture:(NSDictionary *)departure {
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
    cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
    cell.detailTextLabel.text = @"";
    cell.textLabel.text = departure[@"time"];
}

//- (NSString *) sectionTypeForSection:(NSInteger)section {
//    NSString *resultString;
//    switch (section) {
//        case 0: {
//            resultString = @"Street";
//            break;
//        }
//        case 1: {
//            if([self.weekdayDepartures count] > 0)
//            {
//                resultString = @"Weekday";
//                break;
//
//            }else if([self.saturdayDepartures count] > 0) {
//                resultString = @"Saturday";
//                break;
//
//            }else if([self.sundayDepartures count] > 0) {
//                resultString = @"Sunday";
//                break;
//
//            }else {
//                resultString = @"None";
//                break;
//            }
//        }
//
//        case 2: {
//            if([self.saturdayDepartures count] > 0) {
//                resultString = @"Saturday";
//                break;
//
//            }else if([self.sundayDepartures count] > 0) {
//                resultString = @"Sunday";
//                break;
//
//            }else {
//                resultString = @"None";
//                break;
//            }
//        }
//
//        case 3: {
//            if([self.sundayDepartures count] > 0) {
//                resultString = @"Sunday";
//                break;
//
//            }else {
//                resultString = @"None";
//                break;
//            }
//        }
//        default: {
//            resultString = @"None";
//            break;
//        }
//    }
//    return resultString;
//}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
