//
//  MKBRestaurants.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MKBRestaurant : NSObject

@property (nonatomic, assign) double ratingStars;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double numberOfRatings;
@property (nonatomic, strong) NSArray *cuisineTypes;
@property (nonatomic, strong) NSArray *logo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSString*)cuisineTypesFormattedString;
- (NSURL*)logoImageURL;

@end