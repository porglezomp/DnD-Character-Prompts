//
//  CComDetailViewController.m
//  Character Compendium
//
//  Created by Caleb Jones on 3/17/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import "CharacterDetailViewController.h"
#import "Character.h"

@interface CharacterDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation CharacterDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.descriptionText.text = [self.detailItem description];
        self.titleBar.title = [self.detailItem name];
        //self.portraitImageView.image = [self.detailItem portrait];
    }
    
/*    CGRect contentRect = CGRectZero;
    for (UIView *view in self.scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
*/
    self.scrollView.contentSize = CGSizeMake(2000, 2000);
    
    NSLog(@"%@", NSStringFromCGSize(self.scrollView.contentSize));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _titleBar.title = [self.detailItem name];
    [self configureView];
}

- (void)viewDidLayoutSubviews
{
    BOOL restoreVertical;
    if ([self.scrollView showsVerticalScrollIndicator]) {
        restoreVertical = YES;
        self.scrollView.showsVerticalScrollIndicator = NO;
    }
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
     
    self.scrollView.contentSize = contentRect.size;
    if (restoreVertical) {
        self.scrollView.showsVerticalScrollIndicator = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
