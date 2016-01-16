//
//  Card.m
//  PlayCard
//
//  Created by xiangxixids on 16/1/12.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (BOOL)isMatched{
    return _matched;
}

- (BOOL)isChosen{
    return _chosen;
}

- (int)match:(NSArray *)otherCards{
    
    int score = 0;
    
    for (Card *card in otherCards){
        
        if ([card.content isEqualToString:self.content]) {
            score = 1;
        }
        
    }
    
    return score;
    
}
@end
