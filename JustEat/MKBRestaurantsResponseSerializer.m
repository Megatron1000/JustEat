//
//  MKBRestaurantsResponseSerializer.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBRestaurantsResponseSerializer.h"
#import "MKBRestaurant.h"

@implementation MKBRestaurantsResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    NSDictionary *responseObject = [super responseObjectForResponse:response
                                                               data:data
                                                              error:error];
    
    NSMutableArray *restaurants = [[NSMutableArray alloc]init];
    
    if ([responseObject isKindOfClass:[NSDictionary class]])
    {
        NSArray *restaurantDictionaries = responseObject[@"Restaurants"];
        
        for (NSDictionary *restaurantDictionary in restaurantDictionaries)
        {
            [restaurants addObject:[MKBRestaurant modelObjectWithDictionary:restaurantDictionary]];
        }
    }
    
    return restaurants;
}

@end
