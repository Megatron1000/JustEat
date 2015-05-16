//
//  MKBSessionManager.m
//  JustEat
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBSessionManager.h"

@implementation MKBSessionManager

- (instancetype)initWithBaseURL
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://api-interview.just-eat.com/"]];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

- (void)findRestuarantsNearPostCode:(NSString*)postCode
                        withSuccess:(void (^)(NSArray *restaurants))success
                         andFailure:(void (^)(NSError *error))failure
{
    NSDictionary *params = @{@"q" : postCode};
    
    [self GET:@"restaurants" parameters:params success:^(NSURLSessionDataTask *task, id responseObject)
    {
        success(responseObject);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        failure(error);
    }];
}

@end
