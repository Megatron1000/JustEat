//
//  JSTestUtils.m
//  Sainsburys
//
//  Created by Mark Bridges on 07/04/2015.
//  Copyright (c) 2015 Sainsbury's. All rights reserved.
//

#import "MKBTestUtils.h"

@implementation MKBTestUtils

+ (NSBundle *)testBundle
{
    return [NSBundle bundleForClass:[self class]];
}

+ (NSString *)loadJSONFromBundle:(NSBundle *)bundle withName:(NSString *)name
{
    return [[NSString alloc] initWithContentsOfFile:[bundle pathForResource:name ofType:@"json"] encoding:NSUTF8StringEncoding error:NULL];
}

+ (NSString *)loadJSONWithName:(NSString *)name
{
    return [self loadJSONFromBundle:[self testBundle] withName:name];
}

+ (NSDictionary *)loadJSONIntoDictionaryWithName:(NSString *)name
{
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:[[self testBundle] pathForResource:name ofType:@"json"]];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    return dict;
}

@end
