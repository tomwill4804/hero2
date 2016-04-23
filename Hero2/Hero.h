//
//  Hero.h
//  HeroTracker
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *homeWorld;
@property (nonatomic, copy) NSString *powers;
@property (nonatomic, copy) NSMutableArray *images;


+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict;

@end

