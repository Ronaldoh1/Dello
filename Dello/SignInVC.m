//
//  SignInVC.m
//  Dello
//
//  Created by Ronald Hernandez on 10/28/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "SignInVC.h"
#import "User.h"
#import <QuartzCore/QuartzCore.h>

@interface SignInVC ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) PFUser *user;
@property CGFloat animatedDistance;

@end

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@implementation SignInVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Initialize the user
    self.user = [PFUser new];

    //Make textfields with rounded corners

    [self.emailTextfield.layer setCornerRadius:14.0f];
    [self.passwordTextfield.layer setCornerRadius:14.0f];
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
- (IBAction)onSignUpButtonTapped:(UIButton *)sender {

    [self presentViewControllerWithName:@"SignUpNavVC" andWithStoryboardName:@"SignUp"];
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

#pragma Marks - hiding keyboard
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0){
        heightFraction = 0.0;
    }
    else if(heightFraction > 1.0){
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown){
        self.animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else{
        self.animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= self.animatedDistance;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];

    [self.view setFrame:viewFrame];

    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textfield{

    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += self.animatedDistance;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];

    [self.view setFrame:viewFrame];

    [UIView commitAnimations];
}
////hide keyboard when the user clicks return
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    [self.view endEditing:true];
    return true;
}
//hide keyboard when user touches outside.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
