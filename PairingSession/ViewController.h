//
//  ViewController.h
//  PairingSession
//
//  Created by Mike Gonzalez on 6/19/14.
//  Copyright (c) 2014 OnStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITextView* inputTextView;
@property (weak, nonatomic) IBOutlet UITextView* outputTextView;

- (NSString*)screenAPI:(NSInteger)input;
- (IBAction)insertQuarter;
- (IBAction)insertDime;

@end
