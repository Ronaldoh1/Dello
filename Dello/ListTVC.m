//
//  ListTVC.m
//  Dello
//
//  Created by Ronald Hernandez on 10/28/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "ListTVC.h"
#import "ListCostumeCell.h"
#import "AddItemVC.h"
#import "User.h"
#import "List.h"

@interface ListTVC ()
@property NSMutableArray *listsArray;

@end

@implementation ListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    //setting image to Navigation Bar's title
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    titleView.font = [UIFont fontWithName:@"Noteworthy" size:25];
    titleView.text = @"Dello";
    titleView.textColor = [UIColor colorWithRed:119.0/255.0 green:158.0/255.0 blue:203.0/255.0 alpha:1.0];
    [self.navigationItem setTitleView:titleView];


    //setup profileImage

    [self setUpProfileImage];

    self.listsArray = [NSMutableArray new];

    //self.listsArray = [NSMutableArray arrayWithObjects:@"Friday night",@"Gifts for Mom", @"Birthday Bash", @"Future Trip", nil];


    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:119.0/255.0 green:158.0/255.0 blue:203.0/255.0 alpha:1.0];





    [self enableTabBars];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    //Change the global tint

 


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

//    UIImage *image = [UIImage imageNamed:@"delloName.png"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(50, 0, 250, 37);
//
//    [self.navigationController.navigationBar addSubview:imageView];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Help Methods 

-(void)enableTabBars{

    for (UITabBarItem *tabBarItem in [[self.tabBarController tabBar] items]) {

        [tabBarItem setEnabled:YES];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listsArray.count;
}


- (ListCostumeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCostumeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    //for every cell we will display the list name and description

    List *list = (List *)[self.listsArray objectAtIndex:indexPath.row];

    cell.listTitle.text = list.listTitle;
    cell.listDescription.text = list.listDescription;


    return cell;
}





#pragma mark - Helper Methods

/*Set up left Tab Button */
 
 //helper method to set up profile image button
 -(void)setUpProfileImage{

// if (self.currentUser != nil){
// //create an image and assign it to defualt image
//
// [self getUsersProfileImage];
//
//
// }else if (self.currentUser == nil){
//
//
// self.tempImage = [UIImage imageNamed:@"defaultImage.png"];
//
// }


     UIImage *profileImage = [UIImage imageNamed:@"profileImage.png"];


 //create button frame
 CGRect buttonFrame = CGRectMake(0, 0, 40, 40);

 //Create left Button
 UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];

 //make the button rounded
 button.layer.cornerRadius = button.frame.size.height / 2;
 button.layer.masksToBounds = YES;
 button.layer.borderWidth = 2.0;
 button.layer.borderColor = [UIColor colorWithRed:119.0/255.0 green:158.0/255.0 blue:203.0/255.0 alpha:1.0].CGColor;

 [button setImage:profileImage forState:UIControlStateNormal];
 [button reloadInputViews];

 //add at tap gesture recognizer to the left button
 UITapGestureRecognizer *tapGesture =
 [[UITapGestureRecognizer alloc] initWithTarget:self
 action:@selector(profileImageTapped)];
 [button addGestureRecognizer:tapGesture];


 //create a custom view for the button
 UIView *profileButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
 profileButtonView.bounds = CGRectOffset(profileButtonView.bounds, 10, 0);

 //add the button to the custom view
 [profileButtonView addSubview:button];

 UIBarButtonItem *profileButtonItem = [[UIBarButtonItem alloc]initWithCustomView:profileButtonView];

 self.navigationItem.leftBarButtonItem = profileButtonItem;


 }
-(void)profileImageTapped{
    NSLog(@"ProfileImage Was tapped");
    [User logOut];
}

- (IBAction)onAddListButtonTapped:(UIBarButtonItem *)sender {
    [self presentAlertControllerForNewList];

    
}


#pragma mark - helper method

/*AlertController for adding an item*/

-(void)presentAlertControllerForNewList{

    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"New List?"
                                  message:@"Enter a title and a short description"
                                  preferredStyle:UIAlertControllerStyleAlert];



    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {




                                                 //create a new list

                                                 //populate the list with items entered in the alert controller
                                                   List *newList = [[List alloc]initListWithTitle:alert.textFields[0].text AndWithDescription:alert.textFields[1].text];

                                                   //add the list to the array and we want to reload data to refresh the view

                                                   [self.listsArray addObject:newList];




                                                   //[self.listsArray addObject:alert.textFields[0].text];
                                                   [self.tableView reloadData];

                                               }];


    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];

    [alert addAction:ok];
    [alert addAction:cancel];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"List Title";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"What's it about?";

    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Hash Tag Your List!";
        
    }];

    [self presentViewController:alert animated:YES completion:nil];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].

    if ([segue.identifier isEqualToString:@"moveToAddItemVC"]) {
        AddItemVC *destinationVC = (AddItemVC *)segue.destinationViewController;

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        destinationVC.list = (List *)self.listsArray[indexPath.row];

        
    }
//     Pass the selected object to the new view controller.
}

@end
