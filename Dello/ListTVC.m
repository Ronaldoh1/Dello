//
//  ListTVC.m
//  Dello
//
//  Created by Ronald Hernandez on 10/28/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "ListTVC.h"
#import "ListCostumeCell.h"

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

    //setup profileImage

    [self setUpProfileImage];

    self.listsArray = [NSMutableArray arrayWithObjects:@"Friday night",@"Gifts for Mom", @"Birthday Bash", @"Future Trip", nil];


    [self enableTabBars];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];


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

    cell.listTitle.text = self.listsArray[indexPath.row];

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
 button.layer.borderColor = [UIColor colorWithRed:12.0/255.0 green:134/255.0 blue:243/255.0 alpha:1].CGColor;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
