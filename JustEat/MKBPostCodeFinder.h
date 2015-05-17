//
//  MKBPostCodeFinder.h
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MKBPostCodeSuccessBlock)(NSString *postCodeString);
typedef void (^MKBPostCodeFailureBlock)(NSError *error);

@interface MKBPostCodeFinder : NSObject

- (void)findCurrentLocationsPostCodeStringWithSuccess:(MKBPostCodeSuccessBlock)success
                                           andFailure:(MKBPostCodeFailureBlock)failure;

@end
