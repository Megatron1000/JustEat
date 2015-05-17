//
//  MKBLogo.m
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBLogo.h"
#import "NSObject+NilKey.h"


NSString *const kMKBLogoStandardResolutionURL = @"StandardResolutionURL";

@implementation MKBLogo

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.standardResolutionURL = [self objectOrNilForKey:kMKBLogoStandardResolutionURL fromDictionary:dict];
    }
    
    return self;
}

@end
