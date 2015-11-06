//
//  User.m
//  Dello
//
//  Created by Ronald Hernandez on 10/29/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "User.h"

@implementation User
@dynamic name;
@dynamic aboutMe;
@dynamic profileImage;
@dynamic gender;
@dynamic age;
@dynamic location;
@dynamic favoriteSpot;
@dynamic friendsArray;
@dynamic isPremium;
@dynamic isFbUser;


//Register the Class

+(void)load{

    [self registerSubclass];
}

@end
