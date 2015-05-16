//
//  MKBRestaurants.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MKBRestaurants : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ratingStars;
@property (nonatomic, assign) BOOL isTemporarilyOffline;
@property (nonatomic, assign) double defaultDisplayRank;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *deals;
@property (nonatomic, assign) BOOL isSponsored;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, strong) NSString *postcode;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *reasonWhyTemporarilyOffline;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *uniqueName;
@property (nonatomic, assign) double numberOfRatings;
@property (nonatomic, assign) BOOL isOpenNowForDelivery;
@property (nonatomic, strong) NSArray *cuisineTypes;
@property (nonatomic, assign) double restaurantsIdentifier;
@property (nonatomic, assign) BOOL isOpenNow;
@property (nonatomic, strong) NSArray *logo;
@property (nonatomic, assign) BOOL isCloseBy;
@property (nonatomic, assign) BOOL isHalal;
@property (nonatomic, assign) BOOL isOpenNowForCollection;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
