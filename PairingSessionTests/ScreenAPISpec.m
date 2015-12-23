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

describe(@"Screen API", ^{
    
    context(@"Accepting money", ^{
        
        __block ScreenAPI* subject = nil;
        
        beforeEach(^{
            subject = [[ScreenAPI alloc] init];
        });
        
        it(@"should have a method to accept coins", ^{
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
        
        it(@"should return Gum and Twinkie as the items", ^{
            NSArray* expectedItems = @[@"Gum", @"Twinkie"];
            [[subject.availableItems should] equal:expectedItems];
        });
    });
    
    context(@"Dispense selected item", ^{
        __block ScreenAPI* subject = nil;
        beforeEach(^{
            subject = [[ScreenAPI alloc] init];
        });
        
        it(@"should have a method to select item", ^{
            [[subject should] respondToSelector:@selector(selectItem:)];
        });
        
        it(@"should dispense twinkie when it receives 3 quarters", ^{
            [subject insertCoin:CoinQuarter];
            [subject insertCoin:CoinQuarter];
            [subject insertCoin:CoinQuarter];

            [[@([subject selectItem:@"Twinkie"]) should] beYes];
        });
        
        it(@"should not dispense a twinkie when it receives less than 3 quarters", ^{
            [subject insertCoin:CoinQuarter];
            [subject insertCoin:CoinQuarter];
            
            [[@([subject selectItem:@"Twinkie"]) should] beNo];
        });
        
        it(@"should not dispense a second twinkie when it doesn't have enough funds", ^{
            [subject insertCoin:CoinQuarter];
            [subject insertCoin:CoinQuarter];
            [subject insertCoin:CoinQuarter];
            [subject selectItem:@"Twinkie"];
            
            [[@([subject selectItem:@"Twinkie"]) should] beNo];
        });
        
        it(@"should dispense a gum, not a twinkie if it only inserted a quarter", ^{
            [subject insertCoin:CoinQuarter];
            
            [[@([subject selectItem:@"Twinkie"]) should] beNo];
            [[@([subject selectItem:@"Gum"]) should] beYes];
        });
    });
});

SPEC_END
