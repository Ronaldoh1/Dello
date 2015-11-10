//
//  GroupCustomCell.h
//  Dello
//
//  Created by Ronald Hernandez on 11/9/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *groupImage;
@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UILabel *groupDescription;

@end
