//
//  MKBLogo.h
//
//  Created by Mark Bridges on 16/05/2015
//  Copyright (c) 2015 Ink Global. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MKBLogo : NSObject

@property (nonatomic, strong) NSString *standardResolutionURL;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
