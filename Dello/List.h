//
//  List.h
//  Dello
//
//  Created by Ronald Hernandez on 11/1/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface List : PFObject<PFSubclassing>
@property (nonatomic, strong) NSString *listTitle;
@property (nonatomic, strong) NSString *listDescription;
@property (nonatomic, strong) NSDate *decisionDueDate;
@property (nonatomic, strong) NSDate *dateOfEvent;
@property (nonatomic, strong) NSString *listType;
@property (nonatomic, strong) NSMutableDictionary *itemsDictionary;
@property (nonatomic, strong) NSDate *decionDate;



-(instancetype)initListWithTitle:(NSString *)title AndWithDescription:(NSString *)description;

@end
