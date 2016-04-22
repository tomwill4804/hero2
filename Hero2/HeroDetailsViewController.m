//
//  HeroDetailsViewControllerTableViewController.m
//  Hero2
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "HeroDetailsViewController.h"

@interface HeroDetailsViewController ()

@end

@implementation HeroDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fullName.text = self.hero.name;
    self.homeWorld.text = self.hero.homeWorld;
    self.powers.text = self.hero.powers;
    
}


@end
