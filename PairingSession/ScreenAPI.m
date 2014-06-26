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

- (NSInteger)insertCoin:(Coin)coin
{
    self.receivedCash += coin;
    return self.receivedCash;
}

- (NSArray*)availableItems
{
    return @[
        @"Gum",
        @"Twinkie"
    ];
}

- (BOOL)selectItem:(NSString*)item
{

    NSDictionary* prices = @{ @"Twinkie" : @75,
                              @"Gum" : @25 };

    if ([prices[item] isEqual:@(self.receivedCash)]) {
        self.receivedCash -= [prices[item] integerValue];
        return YES;
    }

    return NO;
}

@end
