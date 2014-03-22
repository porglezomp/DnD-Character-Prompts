//
//  CategoryViewController.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/22/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SortCategory.h"

@interface CategoryViewController : UITableViewController

@property (strong, nonatomic) SortCategory* category;

- (void) setCategory:(SortCategory *)category;
@end
