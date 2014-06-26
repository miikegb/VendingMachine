//
//  ViewController.m
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import "ViewController.h"
#import "ScreenAPI.h"

@interface ViewController () <UITextViewDelegate>

@property (nonatomic) NSInteger dispensedCash;
@property (nonatomic, strong) ScreenAPI* screenAPI;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenAPI = [[ScreenAPI alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.inputTextView becomeFirstResponder];
    self.inputTextView.delegate = self;
}

- (NSString*)screenAPI:(NSInteger)input
{
    if (input == CoinQuarter) {
        return @"Dispensing gum";
    }
    return nil;
}

- (IBAction)insertQuarter
{
    NSString* inputText = self.inputTextView.text;
    self.inputTextView.text = [inputText stringByAppendingString:@"Inserted quarter\n"];

    self.dispensedCash = [self.screenAPI insertCoin:CoinQuarter];

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
    return self.screenAPI.availableItems.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"VendingMachineItem"];
    cell.textLabel.text = self.screenAPI.availableItems[indexPath.row];
    return cell;
}

@end
