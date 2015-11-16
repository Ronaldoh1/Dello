//
//  AddFriendVC.m
//  Dello
//
//  Created by Ronald Hernandez on 11/15/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "AddFriendVC.h"
#import "User.h"

@interface AddFriendVC ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *searchResultsArray;

//Property to store the PFUser Found.
@property (nonatomic, strong) User *foundUser;

@end

@implementation AddFriendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //Set the search bar's delegate as the ViewController (Self)
    self.searchBar.delegate = self;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView DataSource 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.searchResultsArray count];;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //create the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];


    return cell;

}

#pragma mark - UISearchBar 

-search

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
