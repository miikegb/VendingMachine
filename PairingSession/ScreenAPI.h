//
//  ScreenAPI.h
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CoinQuarter = 0x100,
    CoinDime
} Coin;

@interface ScreenAPI : NSObject

- (NSNumber*)insertCoin:(Coin)coin;

@end
