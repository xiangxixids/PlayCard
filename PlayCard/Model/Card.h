//
//  Card.h
//  PlayCard
//
//  Created by xiangxixids on 16/1/12.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *content;

@property (nonatomic) BOOL  chosen;
@property (nonatomic) BOOL  matched;

- (int)match:(NSArray *)otherCards;
- (BOOL)isMatched;
- (BOOL)isChosen;

@end
