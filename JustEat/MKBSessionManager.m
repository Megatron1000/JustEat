//
//  MKBSessionManager.m
//  JustEat
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBSessionManager.h"
#import "MKBRestaurantsResponseSerializer.h"

@implementation MKBSessionManager

#pragma mark Initialising

- (instancetype)initForJustEat
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://api-interview.just-eat.com/"]
         sessionConfiguration    :[MKBSessionManager justEatConfiguration]];
    if (self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [MKBRestaurantsResponseSerializer serializer];
    }
    
    return self;
}

+ (NSURLSessionConfiguration *)justEatConfiguration
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [configuration setHTTPAdditionalHeaders:@{
                                              @"Host": @"api-interview.just-eat.com",
                                              @"Accept-Language": @"en-GB",
                                              @"Authorization": @"Basic VGVjaFRlc3RBUEk6dXNlcjI=",
                                              @"Accept-Tenant": @"uk",
                                              }];
    
    return configuration;
}

#pragma mark Network Calls

- (void)findRestuarantsNearPostCode:(NSString *)postCode
                        withSuccess:(void (^)(NSArray *restaurants))success
                         andFailure:(void (^)(NSError *error))failure
{
    NSDictionary *params = @{
                             @"q" : postCode
                             };
    
    [self   GET:@"restaurants" parameters:params success: ^(NSURLSessionDataTask *task, id responseObject)
     {
         success(responseObject);
     }
        failure: ^(NSURLSessionDataTask *task, NSError *error)
     {
         failure(error);
     }];
}

@end
