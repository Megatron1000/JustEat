//
//  UIView+WellRounded.m
//  
//
//  Created by Mark Bridges on 17/05/2015.
//
//

#import "UIView+WellRounded.h"
#import "UIColor+JustEatScheme.h"

@implementation UIView (WellRounded)

- (void)addRoundingAndBorder
{
    self.layer.cornerRadius = 3;
    self.layer.borderColor = [UIColor justEatGray].CGColor;
    self.layer.borderWidth = 1;
    self.layer.masksToBounds = YES;
}

@end
