//
//  EKStitchCounterTableViewCell.m
//  EKStitchCounter
//
//  Created by Sandy Wen on 4/10/13.
//  Copyright (c) 2013 Sandy Wen. All rights reserved.
//

#import "EKStitchCounterTableViewCell.h"

@implementation EKStitchCounterTableViewCell
@synthesize counterTitleLabel, counterNumLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
