//
//  MKBRestaurants.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MKBRestaurant : NSObject

@property (nonatomic, assign) double ratingStars;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int numberOfRatings;
@property (nonatomic, strong) NSArray *cuisineTypes;
@property (nonatomic, strong) NSArray *logo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSString*)cuisineTypesFormattedString;
- (NSString*)numberOfRatingsFormattedString;
- (NSURL*)logoImageURL;

@end
