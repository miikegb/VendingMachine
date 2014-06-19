//
//  ViewController.m
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.inputTextView becomeFirstResponder];
    self.inputTextView.delegate = self;
}

#pragma mark - UITextViewDelegate

//- (void)textViewDidChange:(UITextView*)textView
//{
//    self.outputTextView.text = textView.text;
//}

- (void)textViewDidEndEditing:(UITextView*)textView
{
    self.outputTextView.text = textView.text;
    NSLog(@"===============================================================================");
    NSLog(@"OUTPUT: %@\n\n", textView.text);
}

@end
