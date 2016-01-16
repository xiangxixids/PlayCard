//
//  ViewController.m
//  PlayCard
//
//  Created by xiangxixids on 16/1/12.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController () <UIAlertViewDelegate>
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}


- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)deck{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)chooseCard:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroudImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.content : @"";
}

- (NSString *)backgroudImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"bg4":@"bg2"];
}
- (IBAction)restartGame:(UIButton *)sender {
    [self showAlert:@"Restart" withContent:@"Will you restart the game?" cancelName:@"Cancel" confirmName:@"Restart" handler:^(UIAlertAction *action) {
        _game = nil;
        [self updateUI];
    }];
}

- (IBAction)giveUpGame:(UIButton *)sender {
    [self showAlert:@"Give Up" withContent:@"Will you give up the game?" cancelName:@"Cancel" confirmName:@"Giveup" handler:^(UIAlertAction *action) {
        _game = nil;
        [self updateUI];
    }];
}

- (void)showAlert:(NSString *)title withContent:(NSString *)content cancelName:(NSString *)cancelTitle confirmName:(NSString *)confirmTitle handler:(void (^ __nullable)(UIAlertAction *action))handler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:content
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:cancelTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                             NSLog(@"%@", cancelTitle);
                                                         } ];
    UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:confirmTitle
                                                            style:UIAlertActionStyleDefault
                                                          handler:handler];
    [alertController addAction:actionCancel];
    [alertController addAction:actionConfirm];
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
