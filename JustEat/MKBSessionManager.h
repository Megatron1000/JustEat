//
//  MKBSessionManager.h
//  JustEat
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface MKBSessionManager : AFHTTPSessionManager

- (instancetype)initForJustEat;

- (void)findRestuarantsNearPostCode:(NSString *)postCode
                        withSuccess:(void (^)(NSArray *restaurants))success
                         andFailure:(void (^)(NSError *error))failure;

@end
