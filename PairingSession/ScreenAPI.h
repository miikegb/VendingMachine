//
//  ScreenAPI.h
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CoinQuarter = 25,
    CoinDime = 10
} Coin;

@interface ScreenAPI : NSObject

- (NSInteger)insertCoin:(Coin)coin;
- (NSArray*)availableItems;

@end
