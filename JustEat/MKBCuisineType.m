//
//  MKBCuisineTypes.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBCuisineType.h"
#import "NSObject+NilKey.h"


NSString *const kMKBCuisineTypesName = @"Name";

@implementation MKBCuisineType

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kMKBCuisineTypesName fromDictionary:dict];
    }
    
    return self;
    
}

@end
