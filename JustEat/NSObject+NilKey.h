//
//  NSObject+NilKey.h
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NilKey)

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end
