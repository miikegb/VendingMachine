//
//  ScreenAPI.m
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import "ScreenAPI.h"

@interface ScreenAPI ()
@property (nonatomic) NSInteger receivedCash;
@end

@implementation ScreenAPI

- (NSNumber*)insertCoin:(Coin)coin
{
    self.receivedCash += [self coinToCash:coin];
    return @(self.receivedCash);
}

- (NSInteger)coinToCash:(Coin)coin
{
    if (coin == CoinQuarter) {
        return 25;
    } else if (coin == CoinDime) {
        return 10;
    }

    return 0;
}

@end
