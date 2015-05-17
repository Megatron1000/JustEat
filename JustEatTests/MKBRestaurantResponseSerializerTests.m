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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSerializesFullResponseIntoArray
{
    NSData *restaurantFixtureData = [MKBTestUtils loadJSONIntoDataWithName:@"RestaurantFullResponse"];
    
    MKBRestaurantsResponseSerializer *serializer = [MKBRestaurantsResponseSerializer serializer];
    
    NSArray *restaurants = [serializer responseObjectForResponse:nil data:restaurantFixtureData error:nil];
    
    XCTAssertEqual(restaurants.count, 204);
}

@end
