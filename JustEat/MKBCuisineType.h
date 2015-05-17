//
//  MKBCuisineTypes.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKBCuisineType : NSObject

@property (nonatomic, copy) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;

@end
