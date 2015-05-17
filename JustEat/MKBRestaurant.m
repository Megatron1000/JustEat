//
//  MKBRestaurants.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBRestaurant.h"
#import "MKBCuisineType.h"
#import "MKBLogo.h"
#import "NSString+ArrayWriter.h"
#import "NSObject+NilKey.h"


NSString *const kMKBRestaurantsRatingStars = @"RatingStars";
NSString *const kMKBRestaurantsName = @"Name";
NSString *const kMKBRestaurantsNumberOfRatings = @"NumberOfRatings";
NSString *const kMKBRestaurantsCuisineTypes = @"CuisineTypes";
NSString *const kMKBRestaurantsLogo = @"Logo";


@implementation MKBRestaurant


#pragma mark Initialising

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]])
    {
        _ratingStars = [[self objectOrNilForKey:kMKBRestaurantsRatingStars fromDictionary:dict] doubleValue];
        _name = [self objectOrNilForKey:kMKBRestaurantsName fromDictionary:dict];
        _numberOfRatings = [[self objectOrNilForKey:kMKBRestaurantsNumberOfRatings fromDictionary:dict] doubleValue];
        
        NSObject *receivedMKBCuisineTypes = dict[kMKBRestaurantsCuisineTypes];
        NSMutableArray *parsedMKBCuisineTypes = [NSMutableArray array];
        if ([receivedMKBCuisineTypes isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *item in (NSArray *)receivedMKBCuisineTypes)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedMKBCuisineTypes addObject:[MKBCuisineType modelObjectWithDictionary:item]];
                }
            }
        }
        
        _cuisineTypes = [NSArray arrayWithArray:parsedMKBCuisineTypes];

        NSObject *receivedMKBLogo = dict[kMKBRestaurantsLogo];
        NSMutableArray *parsedMKBLogo = [NSMutableArray array];
        if ([receivedMKBLogo isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedMKBLogo)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedMKBLogo addObject:[MKBLogo modelObjectWithDictionary:item]];
                }
            }
        }
        
        _logo = [NSArray arrayWithArray:parsedMKBLogo];
    }
    
    return self;
}


#pragma custom methods

- (NSString*)cuisineTypesFormattedString
{
    NSArray *cuisineTypes = [self.cuisineTypes valueForKey:@"name"];
    
    return [NSString stringWithArray:cuisineTypes];
}

- (NSString*)numberOfRatingsFormattedString
{
    NSString *ratingsString = [NSString stringWithFormat:@"(%d)", self.numberOfRatings];
    
    return ratingsString;
}

- (NSURL*)logoImageURL
{
    MKBLogo *firstLogo = self.logo.firstObject;
    NSString *urlStringOfLogo = firstLogo.standardResolutionURL;
    
    return [NSURL URLWithString:urlStringOfLogo];
}

@end
