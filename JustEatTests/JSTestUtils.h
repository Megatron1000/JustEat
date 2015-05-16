//
//  JSTestUtils.h
//  Sainsburys
//
//  Created by Mark Bridges on 07/04/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTestUtils : NSObject

+ (NSBundle *)testBundle;
+ (NSString *)loadJSONFromBundle:(NSBundle *)bundle withName:(NSString *)name;
+ (NSString *)loadJSONWithName:(NSString *)name;
+ (NSDictionary *)loadJSONIntoDictionaryWithName:(NSString *)name;

@end
