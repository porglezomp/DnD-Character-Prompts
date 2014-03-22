//
//  CComMasterViewController.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/17/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CharacterDetailViewController;

@interface CharacterMasterViewController : UITableViewController

@property (strong, nonatomic) CharacterDetailViewController *detailViewController;

@end
