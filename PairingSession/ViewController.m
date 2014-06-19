//
//  ViewController.m
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (nonatomic) NSInteger dispensedCash;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.inputTextView becomeFirstResponder];
    self.inputTextView.delegate = self;
}

- (NSString*)screenAPI:(NSInteger)input
{
    if (input == 25) {
        return @"Dispensing gum";
    }
    return nil;
}

- (IBAction)insertQuarter
{
    NSString* inputText = self.inputTextView.text;
    self.inputTextView.text = [inputText stringByAppendingString:@"Inserted quarter\n"];

    self.dispensedCash += 25;

    NSString* outputFromScreenAPI = [self screenAPI:self.dispensedCash];
    self.outputTextView.text = outputFromScreenAPI;
}

- (IBAction)insertDime
{
    NSString* inputText = self.inputTextView.text;
    self.inputTextView.text = [inputText stringByAppendingString:@"Inserted dime\n"];

    NSString* outputFromScreenAPI = [self screenAPI:self.dispensedCash];
    self.outputTextView.text = outputFromScreenAPI;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"VendingMachineItem"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Gum";
    } else {
        cell.textLabel.text = @"Twinkie";
    }
    return cell;
}

@end
