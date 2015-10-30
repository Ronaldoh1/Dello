//
//  SignInVC.m
//  Dello
//
//  Created by Ronald Hernandez on 10/28/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "SignInVC.h"
#import "User.h"

@interface SignInVC ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) PFUser *user;
@end

@implementation SignInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Initialize the user
    self.user = [PFUser new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onCancelButtonTapped:(UIBarButtonItem *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)onSignInButtonTapped:(UIButton *)sender {

    NSString *error = @"";

    if ([self.emailTextfield.text isEqualToString:@""] || [self.passwordTextfield.text isEqualToString:@""]) {

       error = @"All fields are required!";

    }else {
        [self signIn];
    }

    if (![error isEqualToString:@""]) {
        [self displayAlertWithTitle:@"Error" andErrorString:error];

    }
    
}

#pragma mark - Helper methods 

-(void)signIn{


    [User logInWithUsernameInBackground:self.emailTextfield.text password:self.passwordTextfield.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.

                                            [self presentViewControllerWithName:@"MainTabBarController" andWithStoryboardName:@"Main"];
                                        } else {
                                            // The login failed. Check error to see why.
                                            [self displayAlertWithTitle:@"Error" andErrorString:error.localizedDescription];
                                        }
                                    }];


}
-(void)displayAlertWithTitle:(NSString *)title andErrorString:(NSString *)errorString{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:errorString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {

        [alert dismissViewControllerAnimated:YES completion:nil];
    }];

    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];
}

//Present VC with storyboard name and NavigationViewController

-(void)presentViewControllerWithName:(NSString *)VcName andWithStoryboardName:(NSString *)SbName{

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:SbName bundle:nil];
    UIViewController *NavCV = [storyBoard instantiateViewControllerWithIdentifier:VcName];

    //present it

    [self presentViewController:NavCV animated:YES completion:nil];
    
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
