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
    
    for (int i=0; i < self.hero.images.count; i++) {
        NSURL *imageURL = [NSURL URLWithString:self.hero.images[i]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImageView *iv = self.images[i];
        iv.image = [UIImage imageWithData:imageData];
    }
    
    self.title = self.hero.name;
   
}


@end
