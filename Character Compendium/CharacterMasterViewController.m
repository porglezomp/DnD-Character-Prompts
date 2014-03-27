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
                    [[Character alloc] initWithName:@"Vonten Brin" andBio:@"Vonten wears dirty grey rags, but always has a splash of color somewhere – dropped handkerchiefs, scarves, and other small things found in the market. Vonten is very friendly and cheerful, and loves meeting new people. He generally doesn't ask for anything, but usually manages to get it anyway."],
                    [[Character alloc] initWithName:@"Lord Denfall" andBio:@"Lord Denfall is well dressed, even for a lord. He is always wearing immaculately cut suits. He is fastidious in everything, and wants to lead any conversation he's in. He is self absorbed."],
                    [[Character alloc] initWithName:@"Caleb Jones" andBio:@"A programmer making this app!"],
                    [[Character alloc] initWithName:@"Bob" andBio:@"A piece of placeholder text! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi et pulvinar leo, vitae venenatis nulla. Nullam in vehicula arcu. Morbi turpis justo, cursus sed fermentum quis, semper viverra dolor. Cras dignissim dui ut velit congue faucibus. Nulla facilisi. Sed pharetra, ligula id sodales pellentesque, massa justo pharetra est, nec imperdiet purus felis posuere massa. Suspendisse porttitor lorem ac egestas lobortis. In hac habitasse platea dictumst. Curabitur vehicula elit eu eros aliquam, eu faucibus nibh placerat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin ac ultricies justo. Etiam nibh ligula, vehicula nec congue a, eleifend mollis arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse in mauris mollis, cursus dolor eget, ultrices velit. Nunc vitae erat mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam eget sodales enim, eget scelerisque neque. Praesent convallis metus et velit condimentum, ut imperdiet augue pellentesque. Duis felis massa, bibendum sit amet arcu in, luctus congue sem. Phasellus commodo euismod tellus, in auctor velit viverra non. Aliquam erat volutpat. Vestibulum vitae condimentum magna, quis scelerisque turpis. Donec enim nulla, varius non venenatis a, eleifend sit amet dui. Maecenas quis suscipit tortor, nec pharetra risus. Maecenas lacinia turpis eget lobortis fringilla. Vivamus facilisis pellentesque nisl vitae sollicitudin. Aliquam posuere mi tincidunt neque semper, et porta elit venenatis. Cras sed metus ullamcorper, vestibulum mauris eu, consectetur metus."],
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
    cell.detailLabel.text = object.bio;
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
