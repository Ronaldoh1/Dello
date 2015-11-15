//
//  Item.m
//  Dello
//
//  Created by Ronald Hernandez on 11/6/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "Item.h"

@implementation Item
@dynamic title;
@dynamic itemDescription;
@dynamic placeLocation;
@dynamic placeRating;
@dynamic hours;
@dynamic profileImage;
@dynamic detail;

//required methods

-(instancetype)initWithItemTitle:(NSString *)title andDescription:(NSString *)description{

    if (self = [super init]) {
        self.title = title;
        self.itemDescription = description;

    }


    return self;
}

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{

    return @"Item";
}

@end
