//
//  MasterViewController.m
//  Character Compendium
//
//  Created by Caleb Jones on 3/21/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import "CategoryListViewController.h"
#import "CategoryViewController.h"
#import "oldSortCategory.h"
#import "ImageLabelCell.h"

@interface CategoryListViewController ()

@end

NSMutableArray *_categories;
long int editline;

@implementation CategoryListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSMutableArray *)categories {
    if (!_categories) {
        _categories = [[NSMutableArray alloc] initWithObjects:
                       [[oldSortCategory alloc] initWithName:@"Location"],
                       [[oldSortCategory alloc] initWithName:@"Disposition"],
                       [[oldSortCategory alloc] initWithName:@"Purpose"],
                       [[oldSortCategory alloc] initWithName:@"Placeholder"], nil];
    }
    return _categories;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    } else {
        return self.categories.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageLabelCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CharactersCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCells" forIndexPath:indexPath];
        cell.Label.text = [self.categories[indexPath.row] name];
        cell.subtitle.text = [self.categories[indexPath.row] selected];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (void) selectedCategoryElement:(CategoryViewController *)controller withValue:(NSString *)value {
    oldSortCategory *cat = self.categories[editline];
    [cat setSelected:value];
    [self.tableView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCategory"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        oldSortCategory *category = self.categories[indexPath.row];
        [[segue destinationViewController] setCategory: category];
        [[segue destinationViewController] setDelegate: self];
        editline = indexPath.row;
    }
}


@end
