//
//  MKBPostCodeFinder.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBPostCodeFinder.h"
#import <CoreLocation/CoreLocation.h>

@interface MKBPostCodeFinder () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, copy) MKBPostCodeSuccessBlock successBlock;
@property (nonatomic, copy) MKBPostCodeFailureBlock failureBlock;

@end

@implementation MKBPostCodeFinder

#pragma mark Superclass Methods

- (void)dealloc
{
    self.locationManager.delegate = nil;
}

#pragma mark Getters & Setters

- (CLLocationManager *)locationManager
{
    if (_locationManager == nil)
    {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        [_locationManager setDelegate:self];
    }
    
    return _locationManager;
}

#pragma mark Initialising

- (void)findCurrentLocationsPostCodeStringWithSuccess:(MKBPostCodeSuccessBlock)success
                                           andFailure:(MKBPostCodeFailureBlock)failure
{
    self.successBlock = success;
    self.failureBlock = failure;
    
    [self requestAccessIfNeeded];
    
    [self.locationManager startUpdatingLocation];
}

- (void)requestAccessIfNeeded
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

#pragma mark Location Manager Delegate Methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusDenied)
    {
        self.failureBlock([NSError errorWithDomain:@"com.bridgetech.locationerror"
                                              code:1
                                          userInfo:@{ NSLocalizedDescriptionKey : @"User denied access to location" }]);
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.locationManager stopUpdatingLocation];
    [self findPostCodeForLocation:locations.lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    self.failureBlock(error);
}

#pragma mark Geocoding

- (void)findPostCodeForLocation:(CLLocation *)location
{
    __weak typeof(self) weakSelf = self;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler: ^(NSArray *placemarks, NSError *error)
     {
         CLPlacemark *placemarkWithPostcode;
         
         for (CLPlacemark *placemark in placemarks)
         {
             if (placemark.postalCode.length > 0)
             {
                 placemarkWithPostcode = placemark;
                 break;
             }
         }
         
         if (placemarkWithPostcode)
         {
             weakSelf.successBlock(placemarkWithPostcode.postalCode);
         }
         else
         {
             weakSelf.failureBlock(error);
         }
     }];
}

@end
