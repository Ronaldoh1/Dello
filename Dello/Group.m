//
//  Group.m
//  Dello
//
//  Created by Ronald Hernandez on 11/6/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "Group.h"

@implementation Group
@dynamic groupOwner;
@dynamic friendsArray;
@dynamic listsArray;

+(void)load{

    [self registerSubclass];
}

+(NSString *)parseClassName{

    return @"Group";
}
@end
