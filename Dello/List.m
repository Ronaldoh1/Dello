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
@dynamic itemsDictionary;
@dynamic decionDate;

//Required parse methods to comply with API

+(void)load{
    [self registerSubclass];
}
+(NSString *)parseClassName{
    return @"List";
}


@end
