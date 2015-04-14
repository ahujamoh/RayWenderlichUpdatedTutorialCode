//
//  ViewController.h
//  QuoteGen
//
//  Created by yww on 4/14/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

- (IBAction)quoteButtonTapped:(id)sender;
@end

