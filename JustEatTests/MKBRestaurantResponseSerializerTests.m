//
//  MKBRestaurantResponseSerializerTests.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MKBRestaurantsResponseSerializer.h"
#import "MKBTestUtils.h"

@interface MKBRestaurantResponseSerializerTests : XCTestCase

@end

@implementation MKBRestaurantResponseSerializerTests

- (void)testSerializesFullResponseIntoArray
{
    NSData *restaurantFixtureData = [MKBTestUtils loadJSONIntoDataWithName:@"RestaurantFullResponse"];
    
    MKBRestaurantsResponseSerializer *serializer = [MKBRestaurantsResponseSerializer serializer];
    
    NSArray *restaurants = [serializer responseObjectForResponse:nil data:restaurantFixtureData error:nil];
    
    XCTAssertEqual(restaurants.count, 204);
}

@end
