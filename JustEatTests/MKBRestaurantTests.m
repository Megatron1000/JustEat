//
//  MKBRestaurantTests.m
//  JustEat
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MKBTestUtils.h"
#import "MKBRestaurant.h"

@interface MKBRestaurantTests : XCTestCase

@end

@implementation MKBRestaurantTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testPopulatingWithJSON
{
    NSDictionary *restaurantFixture = [MKBTestUtils loadJSONIntoDictionaryWithName:@"Restaurant"];
    
    MKBRestaurant *restaurant = [[MKBRestaurant alloc]initWithDictionary:restaurantFixture];
    
    XCTAssertEqualObjects(restaurant.name, @"La Bella Vita - Collection Only");
    XCTAssertEqualObjects(restaurant.cuisineTypesFormattedString, @"Pizza and Italian.");
    XCTAssertEqualObjects(restaurant.logoImageURL, [NSURL URLWithString:@"http://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/45146.gif"]);
    XCTAssertEqual(restaurant.ratingStars, 6);
    XCTAssertEqual(restaurant.numberOfRatings, 1);
}

@end
