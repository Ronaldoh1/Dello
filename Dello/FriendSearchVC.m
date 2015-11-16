//
//  FriendSearchVC.m
//  Dello
//
//  Created by Ronald Hernandez on 11/15/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "FriendSearchVC.h"

@interface FriendSearchVC ()<UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *friendsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *searchResultsArray;

@end

@implementation FriendSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //Now we need to create and set up the Search Controller

    //Need to instantiate the SearchResult ViewController with it's storyboard identifier. This is necesseary because there is no connection in our storyboard to the search results ViewController.

    //The UISearchController takes care of creating a search bar for us.
    //The Tableview controller will also act as the search bar delegate for when the user changes the search scope

    UINavigationController *searchResultsNavController = [[self storyboard] instantiateViewControllerWithIdentifier:@"TableSearchResultsNavController"];

    //get an instance of UISearchController
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:searchResultsNavController];
    //set the searchResult Delegate
    self.searchController.searchResultsUpdater = self;

    //Need to create searchBar Programmatically.
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);

    self.tableView.tableHeaderView = self.searchController.searchBar;



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Mark - UITableView Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //Initialize the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (cell == nil) {

        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];

    }










    return cell;
}

#pragma mark - UISearchControllerDelegate & UISearchResultsDelegate

//Called when the search bar becomes first responder

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{

}

//Update the searchResults Array based on the searchString.

-(void)updateResultsArrayForSearchString:(NSString *)searchString{

    if ([searchString isEqualToString:@""]) {
        
    }
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
