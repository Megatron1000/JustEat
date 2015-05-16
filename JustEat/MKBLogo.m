//
//  MKBLogo.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import "MKBLogo.h"


NSString *const kMKBLogoStandardResolutionURL = @"StandardResolutionURL";


@interface MKBLogo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MKBLogo

@synthesize standardResolutionURL = _standardResolutionURL;


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
            self.standardResolutionURL = [self objectOrNilForKey:kMKBLogoStandardResolutionURL fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.standardResolutionURL forKey:kMKBLogoStandardResolutionURL];

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

    self.standardResolutionURL = [aDecoder decodeObjectForKey:kMKBLogoStandardResolutionURL];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_standardResolutionURL forKey:kMKBLogoStandardResolutionURL];
}

- (id)copyWithZone:(NSZone *)zone
{
    MKBLogo *copy = [[MKBLogo alloc] init];
    
    if (copy) {

        copy.standardResolutionURL = [self.standardResolutionURL copyWithZone:zone];
    }
    
    return copy;
}


@end
