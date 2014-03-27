//
//  Character.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/26/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Attribute, Town;

@interface Character : NSManagedObject

@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * copyright;
@property (nonatomic, retain) NSString * copyright_edited;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * portrait;
@property (nonatomic, retain) NSSet *attributes;
@property (nonatomic, retain) Town *hometown;
@end

@interface Character (CoreDataGeneratedAccessors)

- (void)addAttributesObject:(Attribute *)value;
- (void)removeAttributesObject:(Attribute *)value;
- (void)addAttributes:(NSSet *)values;
- (void)removeAttributes:(NSSet *)values;

@end
