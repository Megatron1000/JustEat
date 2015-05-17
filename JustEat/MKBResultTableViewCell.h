//
//  MKBResultTableViewCell.h
//  Just Eat Test
//
//  Created by Mark Bridges on 16/05/2015.
//  Copyright (c) 2015 Mark Bridges. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKBRatingsView.h"

@interface MKBResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuisinesLabel;
@property (weak, nonatomic) IBOutlet MKBRatingsView *ratingsView;
@property (weak, nonatomic) IBOutlet UILabel *numberOfRatingsLabel;

@end
