//
//  MKBRestaurants.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import "MKBRestaurants.h"
#import "MKBCuisineTypes.h"
#import "MKBLogo.h"


NSString *const kMKBRestaurantsRatingStars = @"RatingStars";
NSString *const kMKBRestaurantsIsTemporarilyOffline = @"IsTemporarilyOffline";
NSString *const kMKBRestaurantsDefaultDisplayRank = @"DefaultDisplayRank";
NSString *const kMKBRestaurantsUrl = @"Url";
NSString *const kMKBRestaurantsDeals = @"Deals";
NSString *const kMKBRestaurantsIsSponsored = @"IsSponsored";
NSString *const kMKBRestaurantsCity = @"City";
NSString *const kMKBRestaurantsIsNew = @"IsNew";
NSString *const kMKBRestaurantsPostcode = @"Postcode";
NSString *const kMKBRestaurantsName = @"Name";
NSString *const kMKBRestaurantsReasonWhyTemporarilyOffline = @"ReasonWhyTemporarilyOffline";
NSString *const kMKBRestaurantsAddress = @"Address";
NSString *const kMKBRestaurantsUniqueName = @"UniqueName";
NSString *const kMKBRestaurantsNumberOfRatings = @"NumberOfRatings";
NSString *const kMKBRestaurantsIsOpenNowForDelivery = @"IsOpenNowForDelivery";
NSString *const kMKBRestaurantsCuisineTypes = @"CuisineTypes";
NSString *const kMKBRestaurantsId = @"Id";
NSString *const kMKBRestaurantsIsOpenNow = @"IsOpenNow";
NSString *const kMKBRestaurantsLogo = @"Logo";
NSString *const kMKBRestaurantsIsCloseBy = @"IsCloseBy";
NSString *const kMKBRestaurantsIsHalal = @"IsHalal";
NSString *const kMKBRestaurantsIsOpenNowForCollection = @"IsOpenNowForCollection";


@interface MKBRestaurants ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MKBRestaurants

@synthesize ratingStars = _ratingStars;
@synthesize isTemporarilyOffline = _isTemporarilyOffline;
@synthesize defaultDisplayRank = _defaultDisplayRank;
@synthesize url = _url;
@synthesize deals = _deals;
@synthesize isSponsored = _isSponsored;
@synthesize city = _city;
@synthesize isNew = _isNew;
@synthesize postcode = _postcode;
@synthesize name = _name;
@synthesize reasonWhyTemporarilyOffline = _reasonWhyTemporarilyOffline;
@synthesize address = _address;
@synthesize uniqueName = _uniqueName;
@synthesize numberOfRatings = _numberOfRatings;
@synthesize isOpenNowForDelivery = _isOpenNowForDelivery;
@synthesize cuisineTypes = _cuisineTypes;
@synthesize restaurantsIdentifier = _restaurantsIdentifier;
@synthesize isOpenNow = _isOpenNow;
@synthesize logo = _logo;
@synthesize isCloseBy = _isCloseBy;
@synthesize isHalal = _isHalal;
@synthesize isOpenNowForCollection = _isOpenNowForCollection;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ratingStars = [[self objectOrNilForKey:kMKBRestaurantsRatingStars fromDictionary:dict] doubleValue];
            self.isTemporarilyOffline = [[self objectOrNilForKey:kMKBRestaurantsIsTemporarilyOffline fromDictionary:dict] boolValue];
            self.defaultDisplayRank = [[self objectOrNilForKey:kMKBRestaurantsDefaultDisplayRank fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kMKBRestaurantsUrl fromDictionary:dict];
            self.deals = [self objectOrNilForKey:kMKBRestaurantsDeals fromDictionary:dict];
            self.isSponsored = [[self objectOrNilForKey:kMKBRestaurantsIsSponsored fromDictionary:dict] boolValue];
            self.city = [self objectOrNilForKey:kMKBRestaurantsCity fromDictionary:dict];
            self.isNew = [[self objectOrNilForKey:kMKBRestaurantsIsNew fromDictionary:dict] boolValue];
            self.postcode = [self objectOrNilForKey:kMKBRestaurantsPostcode fromDictionary:dict];
            self.name = [self objectOrNilForKey:kMKBRestaurantsName fromDictionary:dict];
            self.reasonWhyTemporarilyOffline = [self objectOrNilForKey:kMKBRestaurantsReasonWhyTemporarilyOffline fromDictionary:dict];
            self.address = [self objectOrNilForKey:kMKBRestaurantsAddress fromDictionary:dict];
            self.uniqueName = [self objectOrNilForKey:kMKBRestaurantsUniqueName fromDictionary:dict];
            self.numberOfRatings = [[self objectOrNilForKey:kMKBRestaurantsNumberOfRatings fromDictionary:dict] doubleValue];
            self.isOpenNowForDelivery = [[self objectOrNilForKey:kMKBRestaurantsIsOpenNowForDelivery fromDictionary:dict] boolValue];
    NSObject *receivedMKBCuisineTypes = [dict objectForKey:kMKBRestaurantsCuisineTypes];
    NSMutableArray *parsedMKBCuisineTypes = [NSMutableArray array];
    if ([receivedMKBCuisineTypes isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMKBCuisineTypes) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMKBCuisineTypes addObject:[MKBCuisineTypes modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMKBCuisineTypes isKindOfClass:[NSDictionary class]]) {
       [parsedMKBCuisineTypes addObject:[MKBCuisineTypes modelObjectWithDictionary:(NSDictionary *)receivedMKBCuisineTypes]];
    }

    self.cuisineTypes = [NSArray arrayWithArray:parsedMKBCuisineTypes];
            self.restaurantsIdentifier = [[self objectOrNilForKey:kMKBRestaurantsId fromDictionary:dict] doubleValue];
            self.isOpenNow = [[self objectOrNilForKey:kMKBRestaurantsIsOpenNow fromDictionary:dict] boolValue];
    NSObject *receivedMKBLogo = [dict objectForKey:kMKBRestaurantsLogo];
    NSMutableArray *parsedMKBLogo = [NSMutableArray array];
    if ([receivedMKBLogo isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMKBLogo) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMKBLogo addObject:[MKBLogo modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMKBLogo isKindOfClass:[NSDictionary class]]) {
       [parsedMKBLogo addObject:[MKBLogo modelObjectWithDictionary:(NSDictionary *)receivedMKBLogo]];
    }

    self.logo = [NSArray arrayWithArray:parsedMKBLogo];
            self.isCloseBy = [[self objectOrNilForKey:kMKBRestaurantsIsCloseBy fromDictionary:dict] boolValue];
            self.isHalal = [[self objectOrNilForKey:kMKBRestaurantsIsHalal fromDictionary:dict] boolValue];
            self.isOpenNowForCollection = [[self objectOrNilForKey:kMKBRestaurantsIsOpenNowForCollection fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ratingStars] forKey:kMKBRestaurantsRatingStars];
    [mutableDict setValue:[NSNumber numberWithBool:self.isTemporarilyOffline] forKey:kMKBRestaurantsIsTemporarilyOffline];
    [mutableDict setValue:[NSNumber numberWithDouble:self.defaultDisplayRank] forKey:kMKBRestaurantsDefaultDisplayRank];
    [mutableDict setValue:self.url forKey:kMKBRestaurantsUrl];
    NSMutableArray *tempArrayForDeals = [NSMutableArray array];
    for (NSObject *subArrayObject in self.deals) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDeals addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDeals addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDeals] forKey:kMKBRestaurantsDeals];
    [mutableDict setValue:[NSNumber numberWithBool:self.isSponsored] forKey:kMKBRestaurantsIsSponsored];
    [mutableDict setValue:self.city forKey:kMKBRestaurantsCity];
    [mutableDict setValue:[NSNumber numberWithBool:self.isNew] forKey:kMKBRestaurantsIsNew];
    [mutableDict setValue:self.postcode forKey:kMKBRestaurantsPostcode];
    [mutableDict setValue:self.name forKey:kMKBRestaurantsName];
    [mutableDict setValue:self.reasonWhyTemporarilyOffline forKey:kMKBRestaurantsReasonWhyTemporarilyOffline];
    [mutableDict setValue:self.address forKey:kMKBRestaurantsAddress];
    [mutableDict setValue:self.uniqueName forKey:kMKBRestaurantsUniqueName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.numberOfRatings] forKey:kMKBRestaurantsNumberOfRatings];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOpenNowForDelivery] forKey:kMKBRestaurantsIsOpenNowForDelivery];
    NSMutableArray *tempArrayForCuisineTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cuisineTypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCuisineTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCuisineTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCuisineTypes] forKey:kMKBRestaurantsCuisineTypes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.restaurantsIdentifier] forKey:kMKBRestaurantsId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOpenNow] forKey:kMKBRestaurantsIsOpenNow];
    NSMutableArray *tempArrayForLogo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.logo) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLogo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLogo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLogo] forKey:kMKBRestaurantsLogo];
    [mutableDict setValue:[NSNumber numberWithBool:self.isCloseBy] forKey:kMKBRestaurantsIsCloseBy];
    [mutableDict setValue:[NSNumber numberWithBool:self.isHalal] forKey:kMKBRestaurantsIsHalal];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOpenNowForCollection] forKey:kMKBRestaurantsIsOpenNowForCollection];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.ratingStars = [aDecoder decodeDoubleForKey:kMKBRestaurantsRatingStars];
    self.isTemporarilyOffline = [aDecoder decodeBoolForKey:kMKBRestaurantsIsTemporarilyOffline];
    self.defaultDisplayRank = [aDecoder decodeDoubleForKey:kMKBRestaurantsDefaultDisplayRank];
    self.url = [aDecoder decodeObjectForKey:kMKBRestaurantsUrl];
    self.deals = [aDecoder decodeObjectForKey:kMKBRestaurantsDeals];
    self.isSponsored = [aDecoder decodeBoolForKey:kMKBRestaurantsIsSponsored];
    self.city = [aDecoder decodeObjectForKey:kMKBRestaurantsCity];
    self.isNew = [aDecoder decodeBoolForKey:kMKBRestaurantsIsNew];
    self.postcode = [aDecoder decodeObjectForKey:kMKBRestaurantsPostcode];
    self.name = [aDecoder decodeObjectForKey:kMKBRestaurantsName];
    self.reasonWhyTemporarilyOffline = [aDecoder decodeObjectForKey:kMKBRestaurantsReasonWhyTemporarilyOffline];
    self.address = [aDecoder decodeObjectForKey:kMKBRestaurantsAddress];
    self.uniqueName = [aDecoder decodeObjectForKey:kMKBRestaurantsUniqueName];
    self.numberOfRatings = [aDecoder decodeDoubleForKey:kMKBRestaurantsNumberOfRatings];
    self.isOpenNowForDelivery = [aDecoder decodeBoolForKey:kMKBRestaurantsIsOpenNowForDelivery];
    self.cuisineTypes = [aDecoder decodeObjectForKey:kMKBRestaurantsCuisineTypes];
    self.restaurantsIdentifier = [aDecoder decodeDoubleForKey:kMKBRestaurantsId];
    self.isOpenNow = [aDecoder decodeBoolForKey:kMKBRestaurantsIsOpenNow];
    self.logo = [aDecoder decodeObjectForKey:kMKBRestaurantsLogo];
    self.isCloseBy = [aDecoder decodeBoolForKey:kMKBRestaurantsIsCloseBy];
    self.isHalal = [aDecoder decodeBoolForKey:kMKBRestaurantsIsHalal];
    self.isOpenNowForCollection = [aDecoder decodeBoolForKey:kMKBRestaurantsIsOpenNowForCollection];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ratingStars forKey:kMKBRestaurantsRatingStars];
    [aCoder encodeBool:_isTemporarilyOffline forKey:kMKBRestaurantsIsTemporarilyOffline];
    [aCoder encodeDouble:_defaultDisplayRank forKey:kMKBRestaurantsDefaultDisplayRank];
    [aCoder encodeObject:_url forKey:kMKBRestaurantsUrl];
    [aCoder encodeObject:_deals forKey:kMKBRestaurantsDeals];
    [aCoder encodeBool:_isSponsored forKey:kMKBRestaurantsIsSponsored];
    [aCoder encodeObject:_city forKey:kMKBRestaurantsCity];
    [aCoder encodeBool:_isNew forKey:kMKBRestaurantsIsNew];
    [aCoder encodeObject:_postcode forKey:kMKBRestaurantsPostcode];
    [aCoder encodeObject:_name forKey:kMKBRestaurantsName];
    [aCoder encodeObject:_reasonWhyTemporarilyOffline forKey:kMKBRestaurantsReasonWhyTemporarilyOffline];
    [aCoder encodeObject:_address forKey:kMKBRestaurantsAddress];
    [aCoder encodeObject:_uniqueName forKey:kMKBRestaurantsUniqueName];
    [aCoder encodeDouble:_numberOfRatings forKey:kMKBRestaurantsNumberOfRatings];
    [aCoder encodeBool:_isOpenNowForDelivery forKey:kMKBRestaurantsIsOpenNowForDelivery];
    [aCoder encodeObject:_cuisineTypes forKey:kMKBRestaurantsCuisineTypes];
    [aCoder encodeDouble:_restaurantsIdentifier forKey:kMKBRestaurantsId];
    [aCoder encodeBool:_isOpenNow forKey:kMKBRestaurantsIsOpenNow];
    [aCoder encodeObject:_logo forKey:kMKBRestaurantsLogo];
    [aCoder encodeBool:_isCloseBy forKey:kMKBRestaurantsIsCloseBy];
    [aCoder encodeBool:_isHalal forKey:kMKBRestaurantsIsHalal];
    [aCoder encodeBool:_isOpenNowForCollection forKey:kMKBRestaurantsIsOpenNowForCollection];
}

- (id)copyWithZone:(NSZone *)zone
{
    MKBRestaurants *copy = [[MKBRestaurants alloc] init];
    
    if (copy) {

        copy.ratingStars = self.ratingStars;
        copy.isTemporarilyOffline = self.isTemporarilyOffline;
        copy.defaultDisplayRank = self.defaultDisplayRank;
        copy.url = [self.url copyWithZone:zone];
        copy.deals = [self.deals copyWithZone:zone];
        copy.isSponsored = self.isSponsored;
        copy.city = [self.city copyWithZone:zone];
        copy.isNew = self.isNew;
        copy.postcode = [self.postcode copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.reasonWhyTemporarilyOffline = [self.reasonWhyTemporarilyOffline copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.uniqueName = [self.uniqueName copyWithZone:zone];
        copy.numberOfRatings = self.numberOfRatings;
        copy.isOpenNowForDelivery = self.isOpenNowForDelivery;
        copy.cuisineTypes = [self.cuisineTypes copyWithZone:zone];
        copy.restaurantsIdentifier = self.restaurantsIdentifier;
        copy.isOpenNow = self.isOpenNow;
        copy.logo = [self.logo copyWithZone:zone];
        copy.isCloseBy = self.isCloseBy;
        copy.isHalal = self.isHalal;
        copy.isOpenNowForCollection = self.isOpenNowForCollection;
    }
    
    return copy;
}


@end
