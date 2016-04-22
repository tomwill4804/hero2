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
        hero.coverName = [heroDict objectForKey:@"coverName"];
        
        hero.accessLevel = [[heroDict objectForKey:@"accessLevel"] intValue];
    }
    return hero;
}


@end
