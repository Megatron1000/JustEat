//
//  MKBCuisineTypes.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MKBCuisineType : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id seoName;
@property (nonatomic, assign) double cuisineTypesIdentifier;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
