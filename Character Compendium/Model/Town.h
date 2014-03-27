//
//  Town.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/26/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character;

@interface Town : NSManagedObject

@property (nonatomic, retain) NSString * banner;
@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *characters;
@end

@interface Town (CoreDataGeneratedAccessors)

- (void)addCharactersObject:(Character *)value;
- (void)removeCharactersObject:(Character *)value;
- (void)addCharacters:(NSSet *)values;
- (void)removeCharacters:(NSSet *)values;

@end
