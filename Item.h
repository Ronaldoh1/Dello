//
//  Item.h
//  Dello
//
//  Created by Ronald Hernandez on 11/6/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Item : PFObject<PFSubclassing>
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) PFGeoPoint *placeLocation;
@property (nonatomic, strong) NSNumber *placeRating;
@property (nonatomic, strong) NSDate *hours;
@property (nonatomic, strong) PFFile *profileImage;
@property (nonatomic, strong) NSString *detail;

-(instancetype)initWithItemTitle:(NSString *)title andDescription:(NSString *)description;
@end
