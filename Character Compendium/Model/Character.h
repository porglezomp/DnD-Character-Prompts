//
//  Character.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/20/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Character : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *bio;
@property (strong, nonatomic)UIImage *portrait;

- (id) initWithName:(NSString *)name;
- (id) initWithName:(NSString *)name andBio:(NSString *)description;
- (id) initWithName:(NSString *)name andBio:(NSString *)description andPortrait:(UIImage *)portrait;

@end
