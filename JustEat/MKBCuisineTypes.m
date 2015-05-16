//
//  MKBCuisineTypes.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import "MKBCuisineTypes.h"


NSString *const kMKBCuisineTypesSeoName = @"SeoName";
NSString *const kMKBCuisineTypesId = @"Id";
NSString *const kMKBCuisineTypesName = @"Name";


@interface MKBCuisineTypes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MKBCuisineTypes

@synthesize seoName = _seoName;
@synthesize cuisineTypesIdentifier = _cuisineTypesIdentifier;
@synthesize name = _name;


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
            self.seoName = [self objectOrNilForKey:kMKBCuisineTypesSeoName fromDictionary:dict];
            self.cuisineTypesIdentifier = [[self objectOrNilForKey:kMKBCuisineTypesId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMKBCuisineTypesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.seoName forKey:kMKBCuisineTypesSeoName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cuisineTypesIdentifier] forKey:kMKBCuisineTypesId];
    [mutableDict setValue:self.name forKey:kMKBCuisineTypesName];

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

    self.seoName = [aDecoder decodeObjectForKey:kMKBCuisineTypesSeoName];
    self.cuisineTypesIdentifier = [aDecoder decodeDoubleForKey:kMKBCuisineTypesId];
    self.name = [aDecoder decodeObjectForKey:kMKBCuisineTypesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_seoName forKey:kMKBCuisineTypesSeoName];
    [aCoder encodeDouble:_cuisineTypesIdentifier forKey:kMKBCuisineTypesId];
    [aCoder encodeObject:_name forKey:kMKBCuisineTypesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    MKBCuisineTypes *copy = [[MKBCuisineTypes alloc] init];
    
    if (copy) {

        copy.seoName = [self.seoName copyWithZone:zone];
        copy.cuisineTypesIdentifier = self.cuisineTypesIdentifier;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
