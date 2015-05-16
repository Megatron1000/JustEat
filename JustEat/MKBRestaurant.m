//
//  MKBRestaurants.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import "MKBRestaurant.h"
#import "MKBCuisineType.h"
#import "MKBLogo.h"
#import "NSString+ArrayWriter.h"

NSString *const kMKBRestaurantsRatingStars = @"RatingStars";
NSString *const kMKBRestaurantsName = @"Name";
NSString *const kMKBRestaurantsNumberOfRatings = @"NumberOfRatings";
NSString *const kMKBRestaurantsCuisineTypes = @"CuisineTypes";
NSString *const kMKBRestaurantsLogo = @"Logo";

@interface MKBRestaurant ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MKBRestaurant


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.ratingStars = [[self objectOrNilForKey:kMKBRestaurantsRatingStars fromDictionary:dict] doubleValue];
        self.name = [self objectOrNilForKey:kMKBRestaurantsName fromDictionary:dict];
        self.numberOfRatings = [[self objectOrNilForKey:kMKBRestaurantsNumberOfRatings fromDictionary:dict] doubleValue];
        
        NSObject *receivedMKBCuisineTypes = [dict objectForKey:kMKBRestaurantsCuisineTypes];
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
        
        self.cuisineTypes = [NSArray arrayWithArray:parsedMKBCuisineTypes];

        NSObject *receivedMKBLogo = [dict objectForKey:kMKBRestaurantsLogo];
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
        
        self.logo = [NSArray arrayWithArray:parsedMKBLogo];
    }
    
    return self;
}

- (NSString*)cuisineTypesFormattedString
{
    NSArray *cuisineTypes = [self.cuisineTypes valueForKey:@"name"];
    
    return [NSString stringWithArray:cuisineTypes];
}

- (NSURL*)logoImageURL
{
    MKBLogo *firstLogo = self.logo.firstObject;
    NSString *urlStringOfLogo = firstLogo.standardResolutionURL;
    
    return [NSURL URLWithString:urlStringOfLogo];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
