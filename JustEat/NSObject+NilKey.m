//
//  NSObject+NilKey.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "NSObject+NilKey.h"

@implementation NSObject (NilKey)

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = dict[aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
