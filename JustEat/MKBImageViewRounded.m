//
//  UImageViewRounded.m
//  JustEat
//
//  Created by Mark Bridges on 17/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBImageViewRounded.h"
#import "UIView+WellRounded.h"

@implementation MKBImageViewRounded

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self addRoundingAndBorder];
}

@end
