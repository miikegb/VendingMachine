//
//  ViewControllerSpec.m
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright 2014 OnStar. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    
    context(@"Buying a Gum", ^{
        
        __block ViewController* subject = nil;
        
        beforeEach(^{
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:[NSBundle bundleForClass:[ViewController class]]];
            subject = [storyBoard instantiateInitialViewController];
        });
        
        it(@"should have a method to process an order", ^{
            [[subject should] respondToSelector:@selector(screenAPI:)];
        });
        
        it(@"should accept a quarter and return a gum", ^{
            NSString* output = [subject screenAPI:25];
            [[output should] equal:@"Dispensing gum"];
        });
        
        it(@"should only accept a quarter and ignore anything else", ^{
            NSString* output = [subject screenAPI:24];
            [[output should] beNil];
        });
    });
});

SPEC_END
