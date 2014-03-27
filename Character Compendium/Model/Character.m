//
//  Character.m
//  Character Compendium
//
//  Created by Caleb Jones on 3/20/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import "Character.h"

@implementation Character

- (id) initWithName:(NSString *)name {
    return [self initWithName:name andBio:@""];
}

- (id) initWithName:(NSString *)name andBio:(NSString *)description {
    return [self initWithName:name andBio:description andPortrait:[UIImage imageWithContentsOfFile:@"Portrait"]];
}

- (id) initWithName:(NSString *)name andBio:(NSString *)description andPortrait:(UIImage *)portrait {
    _name = name;
    _bio = description;
    _portrait = portrait;
    return self;
}

@end