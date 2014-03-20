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
    return [self initWithName:name andDescription:@""];
}

- (id) initWithName:(NSString *)name andDescription:(NSString *)description {
    return [self initWithName:name andDescription:description andPortrait:[UIImage imageWithContentsOfFile:@"Portrait"]];
}

- (id) initWithName:(NSString *)name andDescription:(NSString *)description andPortrait:(UIImage *)portrait {
    _name = name;
    _description = description;
    _portrait = portrait;
    return self;
}

@end
