//
//  MKBRestaurants.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MKBRestaurant : NSObject

@property (nonatomic, assign) double ratingStars;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int numberOfRatings;
@property (nonatomic, copy) NSArray *cuisineTypes;
@property (nonatomic, copy) NSArray *logo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSString*)cuisineTypesFormattedString;
- (NSString*)numberOfRatingsFormattedString;
- (NSURL*)logoImageURL;

@end
