//
//  SortCategory.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/26/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Attribute;

@interface SortCategory : NSManagedObject

@property (nonatomic, retain) NSString * banner;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *attributes;
@end

@interface SortCategory (CoreDataGeneratedAccessors)

- (void)addAttributesObject:(Attribute *)value;
- (void)removeAttributesObject:(Attribute *)value;
- (void)addAttributes:(NSSet *)values;
- (void)removeAttributes:(NSSet *)values;

@end
