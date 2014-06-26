//
//  ScreenAPISpec.m
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright 2014 OnStar. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ScreenAPI.h"

SPEC_BEGIN(ScreenAPISpec)

describe(@"ScreenAPI", ^{
    context(@"Creation", ^{
        it(@"should be able to be created", ^{
            ScreenAPI* subject = [[ScreenAPI alloc] init];
            [[subject shouldNot] beNil];
        });
    });
    
    context(@"Accepting money", ^{
        
        __block ScreenAPI* subject = nil;
        
        beforeEach(^{
            subject = [[ScreenAPI alloc] init];
        });
        
        it(@"should have a method to process an order", ^{
            [[subject should] respondToSelector:@selector(insertCoin:)];
        });
        
        it(@"should accept a quarter and return 25", ^{
            NSInteger output = [subject insertCoin:CoinQuarter];
            [[@(output) should] equal:@25];
        });
        
        it(@"should accept one or more coins (quarter, dime) and return sum", ^{
            NSInteger output = [subject insertCoin:CoinQuarter];
            output = [subject insertCoin:CoinQuarter];
            output = [subject insertCoin:CoinDime];
            
            [[@(output) should] equal:@60];
        });
    });
    
    context(@"Return list of items", ^{
         __block ScreenAPI* subject = nil;
        beforeEach(^{
            subject = [[ScreenAPI alloc] init];
        });
        
        
    });
});

SPEC_END
