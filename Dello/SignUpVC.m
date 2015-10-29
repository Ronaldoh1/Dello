//
//  SignUpVC.m
//  Dello
//
//  Created by Ronald Hernandez on 10/28/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "SignUpVC.h"
#import "User.h"

@interface SignUpVC ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextfield;

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSignUpButtonTapped:(UIButton *)sender {
    NSString *error = nil;

    if(![self.passwordTextfield.text isEqualToString:self.confirmPasswordTextfield.text]){
        error = @"Passwords do not match, please try again";

    }else if([self.passwordTextfield.text length] < 6 || [self.confirmPasswordTextfield.text length] < 6){
         error = @"You password must be at least 6 Characters";

    }else if([self.emailTextfield.text isEqualToString:@""] || [self.passwordTextfield.text isEqualToString:@""] || [self.confirmPasswordTextfield.text isEqualToString:@""]) {

    }else{
        //if the user has input everythign correctly - simply sign them up.

        [self signUp];
    }

    //if there an error, then present that error to the user.

    if (![error isEqualToString:@""]) {

    }

}
-(void)signUp{

    User *user = [User user];
    user.username = self.emailTextfield.text;
    user.email = self.emailTextfield.text;
    user.password = self.passwordTextfield.text;

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.

            NSLog(@"let them Use the app");

        } else {

            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
            [self displayAlertWithTitle:@"Error" andErrorString:errorString];
        }
    }];
}


#pragma mark - Helper methods 
-(void)displayAlertWithTitle:(NSString *)title andErrorString:(NSString *)errorString{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:errorString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {

        [alert dismissViewControllerAnimated:YES completion:nil];
    }];

    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];
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
