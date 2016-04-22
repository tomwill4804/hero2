//
//  Hero.m
//  Hero2
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *hero = nil;
    if (heroDict)
    {
        hero = [[Hero alloc] init];
        hero.name = [heroDict objectForKey:@"name"];
        hero.homeWorld = [heroDict objectForKey:@"homeworld"];
        hero.powers = [heroDict objectForKey:@"powers"];
        
    }
    return hero;
}


@end
