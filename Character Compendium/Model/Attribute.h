//
//  Attribute.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/26/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character, SortCategory;

@interface Attribute : NSManagedObject

@property (nonatomic, retain) NSString * banner;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) SortCategory *category;
@property (nonatomic, retain) Character *character;

@end
