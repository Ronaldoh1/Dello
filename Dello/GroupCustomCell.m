//
//  GroupCustomCell.m
//  Dello
//
//  Created by Ronald Hernandez on 11/9/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "GroupCustomCell.h"

@implementation GroupCustomCell

- (void)awakeFromNib {
    // Initialization code

    //Set up each cell
    self.groupImage.layer.cornerRadius = self.groupImage.frame.size.height / 2;
    self.groupImage.layer.masksToBounds = YES;
    self.groupImage.layer.borderWidth = 2.0;
    self.groupImage.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
