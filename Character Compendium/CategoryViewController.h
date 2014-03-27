//
//  CategoryViewController.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/22/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oldSortCategory.h"

@class CategoryViewController;

@protocol CategoryViewDelegate <NSObject>
- (void) selectedCategoryElement:(CategoryViewController *)controller withValue:(NSString *)value;
@end

@interface CategoryViewController : UITableViewController

@property (strong, nonatomic) oldSortCategory* category;
@property (nonatomic, weak) id <CategoryViewDelegate> delegate;

- (void) setCategory:(oldSortCategory *)category;
@end
