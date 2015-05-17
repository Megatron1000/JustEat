//
//  MKBRatingsView.m
//  Just Eat Test
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import "MKBRatingsView.h"
#import "PureLayout.h"

@interface MKBRatingsView ()

@property (nonatomic, strong) UIView *fillView;
@property (nonatomic, strong) NSLayoutConstraint *fillViewWidthConstraint;

@end

@implementation MKBRatingsView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self configureView];
    }
    
    return self;
}

- (void)configureView
{
    UIView *starView = [[[NSBundle mainBundle] loadNibNamed:@"StarMask" owner:self options:nil]lastObject];
    [self addSubview:starView];
    [starView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];

    _fillView = [[UIView alloc]initForAutoLayout];
    [self addSubview:_fillView];
    _fillView.backgroundColor = [UIColor yellowColor];
    [_fillView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
    self.fillViewWidthConstraint = [_fillView autoSetDimension:ALDimensionWidth toSize:self.frame.size.width];
    
    UIView *starMask = [[[NSBundle mainBundle] loadNibNamed:@"StarMask" owner:self options:nil]lastObject];
    self.maskView = starMask;
}

- (void)setRating:(float)rating
{
    self.fillViewWidthConstraint.constant = self.frame.size.width * (rating / 6);
    [self setNeedsLayout];
    
    _rating = rating;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
