//
//  WelcomeVC.m
//  Dello
//
//  Created by Ronald Hernandez on 10/28/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "WelcomeVC.h"
#import <Parse.h>
#import "User.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
@interface WelcomeVC ()
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.signInButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.signInButton.layer.borderWidth = 3.0;
//
//    self.signUpButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.signUpButton.layer.borderWidth = 3.0;



}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];

    if ([User currentUser] != nil) {
        [self presentViewControllerWithName:@"MainTabBarController" andWithStoryboardName:@"Main"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSignInButtonTapped:(UIButton *)sender{

    UIStoryboard *signInStoryBoard = [UIStoryboard storyboardWithName:@"SignIn" bundle:nil];
    UINavigationController *signInNavVC = [signInStoryBoard instantiateViewControllerWithIdentifier:@"SignInNavVC"];
    [self presentViewController:signInNavVC animated:YES completion:nil];
}

- (IBAction)onSignUpButtonTapped:(UIButton *)sender {

    UIStoryboard *signUpStoryBoard = [UIStoryboard storyboardWithName:@"SignUp" bundle:nil];
    UINavigationController *signUpNavVC = [signUpStoryBoard instantiateViewControllerWithIdentifier:@"SignUpNavVC"];
    [self presentViewController:signUpNavVC animated:YES completion:nil];
    


}
- (IBAction)onSignInWithFbButtonTapped:(UIButton *)sender {
    //1. need to get user's permissions.
    NSArray *permissionsArray = [NSArray arrayWithObjects:@"public_profile", @"email", @"user_friends", nil];

    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
        } else {
            NSLog(@"User logged in through Facebook!");

            
            [self presentViewControllerWithName:@"MainTabBarController" andWithStoryboardName:@"Main"];

        }
    }];

}

//Present VC with storyboard name and NavigationViewController

-(void)presentViewControllerWithName:(NSString *)VcName andWithStoryboardName:(NSString *)SbName{

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:SbName bundle:nil];
    UIViewController *mainTabbar = [storyBoard instantiateViewControllerWithIdentifier:VcName];

    //present it

    [self presentViewController:mainTabbar animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
