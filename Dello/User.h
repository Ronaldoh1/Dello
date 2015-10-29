//
//  User.h
//  Dello
//
//  Created by Ronald Hernandez on 10/29/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : PFUser<PFSubclassing>
@property (nonatomic, strong)  NSString *name;
@property (nonatomic, strong) NSString *aboutMe;
@property (nonatomic, strong) PFFile *profileImage;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSNumber *age;
@property  BOOL isFBUser;


@end
