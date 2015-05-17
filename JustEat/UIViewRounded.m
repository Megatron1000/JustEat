//
//  UIViewRounded.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "UIViewRounded.h"
#import "UIView+WellRounded.h"

@implementation UIViewRounded

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [self addRoundingAndBorder];
}

@end
