//
//  MKBResultsViewControllerTests.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MKBResultsViewController.h"
#import "MKBRestaurant.h"
#import "OCMock.h"
#import "MKBResultTableViewCell.h"

@interface MKBResultsViewControllerTests : XCTestCase

@property (nonatomic, strong) MKBResultsViewController *viewController;

@end

@implementation MKBResultsViewControllerTests

- (void)setUp
{
    [super setUp];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewController = (MKBResultsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Results"];
    
    MKBRestaurant *restaurant1 = [[MKBRestaurant alloc]init];
    restaurant1.name = @"Mark's Deli";
    restaurant1.numberOfRatings = 4;
    restaurant1.ratingStars = 5.5;
    id mockRestaurant1 = OCMPartialMock(restaurant1);
    OCMStub([mockRestaurant1 cuisineTypesFormattedString]).andReturn(@"Sandwiches");
    
    MKBRestaurant *restaurant2 = [[MKBRestaurant alloc]init];
    restaurant2.name = @"Steph's Takeaway";
    restaurant2.numberOfRatings = 5;
    restaurant2.ratingStars = 1;
    id mockRestaurant2 = OCMPartialMock(restaurant2);
    OCMStub([mockRestaurant2 cuisineTypesFormattedString]).andReturn(@"Pizza");
    
    self.viewController.restaurants = @[mockRestaurant1, mockRestaurant2];
    
    [self.viewController view];
}

- (void)testCellConfiguredWithRestaurant
{
    MKBResultTableViewCell *cell = (MKBResultTableViewCell *)[self.viewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    XCTAssertEqualObjects(cell.nameLabel.text, @"Mark's Deli");
    XCTAssertEqualObjects(cell.cuisinesLabel.text, @"Sandwiches");
    XCTAssertEqualObjects(cell.numberOfRatingsLabel.text, @"(4)");
    XCTAssertEqual(cell.ratingsView.rating, 5.5);
}

- (void)testNumberOfRowsEqualsNumberOfRestaurants
{
    NSInteger numberOfRows = [self.viewController.tableView numberOfRowsInSection:0];
    
    XCTAssertEqual(numberOfRows, 2);
}

@end
