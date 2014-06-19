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
    
    context(@"First test", ^{
        
        it(@"should fail", ^{
            [[@YES should] beNo];
        });
    });
});

SPEC_END
