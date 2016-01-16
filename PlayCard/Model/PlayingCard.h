//
//  PlayingCard.h
//  PlayCard
//
//  Created by xiangxixids on 16/1/12.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface PlayingCard : Card

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
