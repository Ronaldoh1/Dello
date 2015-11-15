//
//  AddItemVC.m
//  Dello
//
//  Created by Ronald Hernandez on 11/7/15.
//  Copyright © 2015 Dello. All rights reserved.
//

#import "AddItemVC.h"
#import "Item.h"

@interface AddItemVC ()<UITableViewDelegate, UITableViewDataSource>
@property UIButton *addItemButton;
@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AddItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addItemButton = [self createButtonWithTitle:@"Done"];

    [self.addItemButton addTarget:self action:@selector(addItemToList) forControlEvents:UIControlEventTouchUpInside];

    self.itemsArray = [NSMutableArray new];

    self.itemsArray = [NSMutableArray arrayWithArray:self.list.itemsArray];

    NSLog(@"%@", self.list.listTitle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onAddItemButttonTapp:(UIBarButtonItem *)sender {

    NSLog(@"Tapped item");
   // [self displayAlertMessage:@"HI" andWith:@"boo"];

    [self presentAlertControllerForNewItem];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsArray count];
}

/* In this method -> cellForRowAtIndexPath: we are going to populate each cell with the appropriate details for each item added.
 
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//1. Initialize the Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

//2. Check if the cell is nill

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }

//3. We need to populate the cell with appropriate details.
    Item *item = [Item new];
    item = (Item *)self.itemsArray[indexPath.row];

    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.itemDescription;

    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - helper methods

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();


    return image;
}
-(void)addItemToList{

    NSLog(@"Add item tapped");

    [self.addItemButton setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];


}

/* Cretate Button */
-(UIButton *)createButtonWithTitle:(NSString *)buttonTitle{

    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 60, self.view.frame.size.height - 110.0, 50.0, 50.0)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = button.frame.size.width /2;

    [self.view addSubview:button];

    return button;
}

/*AlertController for adding an item*/

-(void)presentAlertControllerForNewItem{

    //1. Create a UIAlertController

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"New Item?"
                                                            message:@"What, When & Where?"
                                                            preferredStyle:UIAlertControllerStyleAlert];

    //2. Create a UIAlertController to be added to the alert.

    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        //Create a new Item
        Item *item = [[Item alloc] initWithItemTitle:alertController.textFields[0].text andDescription:alertController.textFields[1].text];

        //Add item to the Array

       // NSMutableArray *array = [NSMutableArray arrayWithArray:self.list.itemsArray];

        [self.itemsArray addObject:item];


        //get the indexPath where the cell should be inserted. Basically we need to get the total count of elements in the array and subtract 1. This will allow us to insert an object at the end and create a new cell after the last cell.

         //  [self.tableView beginUpdates];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.itemsArray count]-1) inSection:0];


        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        //[self.tableView endUpdates];

        self.list.itemsArray = self.itemsArray;

    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];



    //3. Add the action to the controller.
    [alertController addAction:addAction];
    [alertController addAction:cancelAction];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Item Title";

    }];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Description";
    }];

    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
