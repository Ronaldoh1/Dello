//
//  ListCostumeCell.h
//  Dello
//
//  Created by Ronald Hernandez on 11/7/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCostumeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *listImage;
@property (weak, nonatomic) IBOutlet UILabel *listTitle;
@property (weak, nonatomic) IBOutlet UILabel *listDescription;

@end
