//
//  Group.h
//  Dello
//
//  Created by Ronald Hernandez on 11/6/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "User.h"

@interface Group : PFObject<PFSubclassing>

@property (nonatomic, strong) User  *groupOwner;
@property (nonatomic, strong) NSMutableArray *friendsArray;
@property (nonatomic, strong) NSMutableDictionary *listsArray;

@end
