//
//  Hero.m
//  Hero2
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)init
{
    self = [super init];
    if (self) {
        _images = [[NSMutableArray alloc] init];
    }
    return self;
}

//
//  create a Hero object using passed dictionary
//
+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *hero = nil;
    if (heroDict) {
        hero = [[Hero alloc] init];
        
        hero.name = heroDict[@"name"];
        hero.homeWorld = heroDict[@"homeworld"];
        hero.powers = heroDict[@"powers"];
        
        for(NSString *imageURL in heroDict[@"images"]) {
            [hero.images addObject:imageURL];
        }
    }
    
    return hero;
    
}


@end
