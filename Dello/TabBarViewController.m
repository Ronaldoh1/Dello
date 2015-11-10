//
//  ViewController.m
//  Dello
//
//  Created by Ronald Hernandez on 10/25/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpTabBars];

    //Set navigation bar tint color


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
      
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self setUpTabBars];
}

//Helper method to set up the tab bars for the application.
-(void)setUpTabBars{

    //Create the first Tab Bar, then use the storyboard to present the firstViewController
    UIStoryboard *listStoryBoard = [UIStoryboard storyboardWithName:@"List" bundle:nil];

    UITabBarController *listTabBar = [listStoryBoard instantiateViewControllerWithIdentifier:@"ListNavController"];
    [self addChildViewController:listTabBar];
    listTabBar.tabBarItem.image = [self imageWithImage:[UIImage imageNamed:@"listTab.png"] scaledToSize:CGSizeMake(35, 35)];
    listTabBar.tabBarItem.title = @"Lists";
;

    //Second Tab Bar
    UIStoryboard *groupStoryBoard = [UIStoryboard storyboardWithName:@"Group" bundle:nil];

    UITabBarController *groupTabBar = [groupStoryBoard instantiateViewControllerWithIdentifier:@"GroupNavController"];
    [self addChildViewController:groupTabBar];
    groupTabBar.tabBarItem.image = [self imageWithImage:[UIImage imageNamed:@"groupTab.png"] scaledToSize:CGSizeMake(35, 35)];
    groupTabBar.tabBarItem.title = @"Groups";
    groupTabBar.tabBarItem.enabled = NO;


    //Third Tab Bar
    UIStoryboard *customListstoryBoard = [UIStoryboard storyboardWithName:@"Vote" bundle:nil];

    UITabBarController *customTabBar = [customListstoryBoard instantiateViewControllerWithIdentifier:@"VoteNavController"];
    [self addChildViewController:customTabBar];
    customTabBar.tabBarItem.image = [self imageWithImage:[UIImage imageNamed:@"voteTab.png"] scaledToSize:CGSizeMake(35, 35)];
    customTabBar.tabBarItem.title = @"Vote";
    customTabBar.tabBarItem.enabled = NO;

    //Fourth Tab Bar
    UIStoryboard *resultsStoryBoard = [UIStoryboard storyboardWithName:@"Result" bundle:nil];


    UITabBarController *resultsTabBar = [resultsStoryBoard instantiateViewControllerWithIdentifier:@"ResultNavController"];
    [self addChildViewController:resultsTabBar];
    resultsTabBar.tabBarItem.image = [self imageWithImage:[UIImage imageNamed:@"resulsTab.png"] scaledToSize:CGSizeMake(35, 35)];
    resultsTabBar.tabBarItem.title = @"Results";
    resultsTabBar.tabBarItem.enabled = NO;

    //Fifth Tab Bar
    UIStoryboard *discoverStoryBoard = [UIStoryboard storyboardWithName:@"Discover" bundle:nil];

    UITabBarController *discoverTabBar = [discoverStoryBoard instantiateViewControllerWithIdentifier:@"DiscoverNavController"];
    [self addChildViewController:discoverTabBar];
    discoverTabBar.tabBarItem.image = [self imageWithImage:[UIImage imageNamed:@"discoverTab.png"] scaledToSize:CGSizeMake(35, 35)];
    discoverTabBar.tabBarItem.title = @"Discover";
    discoverTabBar.tabBarItem.enabled = NO;



}
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 1, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
