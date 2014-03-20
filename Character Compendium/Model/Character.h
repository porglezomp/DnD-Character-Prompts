//
//  Character.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/20/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *description;
@property (strong, nonatomic)UIImage *portrait;

- (id) initWithName:(NSString *)name;
- (id) initWithName:(NSString *)name andDescription:(NSString *)description;
- (id) initWithName:(NSString *)name andDescription:(NSString *)description andPortrait:(UIImage *)portrait;

@end
