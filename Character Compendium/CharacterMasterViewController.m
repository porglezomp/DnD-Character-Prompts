//
//  CComMasterViewController.m
//  Character Compendium
//
//  Created by Caleb Jones on 3/17/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import "CharacterMasterViewController.h"
#import "Character.h"
#import "CharacterCell.h"
#import "CharacterDetailViewController.h"

@interface CharacterMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation CharacterMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (NSMutableArray *)objects {
    if (!_objects) {
        _objects = [[NSMutableArray alloc] initWithObjects:
                    [[Character alloc] initWithName:@"Vonten Brin" andDescription:@"Vonten wears dirty grey rags, but always has a splash of color somewhere – dropped handkerchiefs, scarves, and other small things found in the market. Vonten is very friendly and cheerful, and loves meeting new people. He generally doesn't ask for anything, but usually manages to get it anyway. Vonten wears dirty grey rags, but always has a splash of color somewhere – dropped handkerchiefs, scarves, and other small things found in the market. Vonten is very friendly and cheerful, and loves meeting new people. He generally doesn't ask for anything, but usually manages to get it anyway. Vonten wears dirty grey rags, but always has a splash of color somewhere – dropped handkerchiefs, scarves, and other small things found in the market. Vonten is very friendly and cheerful, and loves meeting new people. He generally doesn't ask for anything, but usually manages to get it anyway. Vonten wears dirty grey rags, but always has a splash of color somewhere – dropped handkerchiefs, scarves, and other small things found in the market. Vonten is very friendly and cheerful, and loves meeting new people. He generally doesn't ask for anything, but usually manages to get it anyway."],
                    [[Character alloc] initWithName:@"Lord Denfall" andDescription:@"Lord Denfall is well dressed, even for a lord. He is always wearing immaculately cut suits. He is fastidious in everything, and wants to lead any conversation he's in. He is self absorbed."],
                    [[Character alloc] initWithName:@"Caleb Jones" andDescription:@"A programmer making this app!"],
                    [[Character alloc] initWithName:@"Bob" andDescription:@"A piece of placeholder text!"],
                    nil];
    }
    return _objects;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.detailViewController = (CharacterDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CharacterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Characters" forIndexPath:indexPath];

    Character *object = self.objects[indexPath.row];
    cell.detailLabel.text = object.description;
    cell.nameLabel.text = object.name;
    //cell.portraitImage.image = object.portrait;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        Character *object = self.objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Character *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
