//
//  HeroDetailsViewControllerTableViewController.h
//  Hero2
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface HeroDetailsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *homeWorld;
@property (weak, nonatomic) IBOutlet UILabel *powers;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *images;

@property (weak, nonatomic) Hero *hero;

@end
