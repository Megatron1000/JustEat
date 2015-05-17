//
//  MKBRestaurantResultsDataSource.m
//  JustEat
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBRestaurantResultsDataSource.h"
#import "MKBRestaurant.h"
#import "MKBResultTableViewCell.h"
#import "UIImageView+AFNetworking.h"

NSString *const restaurantCellIdentifier = @"RestaurantResultCell";

@implementation MKBRestaurantResultsDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MKBResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:restaurantCellIdentifier];
    MKBRestaurant *restaurant = self.restaurants[indexPath.row];
    
    cell.nameLabel.text = restaurant.name;
    cell.cuisinesLabel.text = [restaurant cuisineTypesFormattedString];
    cell.ratingsView.rating = restaurant.ratingStars;
    cell.numberOfRatingsLabel.text = [restaurant numberOfRatingsFormattedString];
    [cell.logoImageView setImageWithURL:[restaurant logoImageURL] placeholderImage:[UIImage imageNamed:@"plateHolder"]];
    
    return cell;
}

@end
