//
//  Hero.h
//  HeroTracker
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *coverName;
@property (nonatomic) NSString *realName;
@property (assign)    NSInteger accessLevel;

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict;

@end

