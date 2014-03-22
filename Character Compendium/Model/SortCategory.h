//
//  Category.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/21/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortCategory : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) UIImage* background;

- (id) initWithName: (NSString *) name;
- (id) initWithName: (NSString *) name andBackground: (UIImage *) background;

@end
