//
//  CharacterCell.h
//  Character Compendium
//
//  Created by Caleb Jones on 3/20/14.
//  Copyright (c) 2014 CaZaToCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImage;


@end
