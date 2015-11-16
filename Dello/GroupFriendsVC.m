//
//  GroupFriendsVC.m
//  Dello
//
//  Created by Ronald Hernandez on 11/15/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "GroupFriendsVC.h"

@interface GroupFriendsVC ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GroupFriendsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];


    return cell;
}

- (IBAction)onAddFriendsToGroupButtonTapped:(UIBarButtonItem *)sender {

    NSLog(@"Need to addd friends");

    [self presentViewControllerWithName:@"AddFriendNavVC" andWithStoryboardName:@"AddFriend"];

    
}

//Present VC with storyboard name and NavigationViewController

-(void)presentViewControllerWithName:(NSString *)VcName andWithStoryboardName:(NSString *)SbName{

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:SbName bundle:nil];
    UINavigationController *NavCV = [storyBoard instantiateViewControllerWithIdentifier:VcName];

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
