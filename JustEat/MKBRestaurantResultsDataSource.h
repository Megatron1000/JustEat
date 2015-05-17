//
//  MKBRestaurantResultsDataSource.h
//  JustEat
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MKBRestaurantResultsDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) NSArray *restaurants;

@end
