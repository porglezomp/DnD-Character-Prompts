//
//  Category.m
//  Character Compendium
//
//  Created by Caleb Jones on 3/21/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import "oldSortCategory.h"

@implementation oldSortCategory

- (id) initWithName:(NSString *)name {
    return [self initWithName:name andBackground:nil];
    return self;
}

- (id) initWithName:(NSString *)name andBackground:(UIImage *)background {
    _name = name;
    _background = background;
    return self;
}

- (NSString*) selected {
    if (!_selected) {
        _selected = @"Any";
    }
    return _selected;
}

@end
