//
//  CComDetailViewController.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/17/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CComDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
