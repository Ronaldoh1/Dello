//
//  VoteCustomCell.m
//  Dello
//
//  Created by Ronald Hernandez on 11/9/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "VoteCustomCell.h"

@implementation VoteCustomCell

- (void)awakeFromNib {
    // Initialization code

    self.listImage.layer.cornerRadius = self.listImage.frame.size.height/2;
    self.listImage.layer.masksToBounds = YES;
    self.listImage.layer.borderWidth = 2.0;
    self.listImage.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
