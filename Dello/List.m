//
//  List.m
//  Dello
//
//  Created by Ronald Hernandez on 11/1/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "List.h"

@implementation List
@dynamic listTitle;
@dynamic listDescription;
@dynamic decisionDueDate;
@dynamic dateOfEvent;
@dynamic listType;
@dynamic itemsArray;
@dynamic decionDate;

//Required parse methods to comply with API

-(instancetype)initListWithTitle:(NSString *)title AndWithDescription:(NSString *)description{


//    if ((self = [super init])) {
//        _name = name;
//        _icons = icons;
//    }
//    return self;

    if ((self = [super init])) {
        self.listTitle = title;
        self.listDescription = description;

    }

    return self;
}

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"List";
}


@end
