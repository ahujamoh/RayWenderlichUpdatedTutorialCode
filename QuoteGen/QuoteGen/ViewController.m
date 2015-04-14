//
//  ViewController.m
//  QuoteGen
//
//  Created by yww on 4/14/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1- Add array of personal quotes
    self.myQuotes = @[
                                        @"Live and let live",
                                        @"Don't cry over split milk",
                                        @"Always look on the bright side of life",
                                        @"Nobody's perfect",
                                        @"Can't see the woods for the trees",
                                        @"Better to have loved and lost then not loved at all",
                                        @"The early bird catches the worm",
                                        @"As slow as a wet week"
                                        ];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}

- (IBAction)quoteButtonTapped:(id)sender
{
//    // 1 - Get number of rows in array
//    int arrayCount = (int)[self.myQuotes count];
//    // 2 - Get random index
//    int index = arc4random() % arrayCount;
//    // 3 - Get the quote string for the index
//    NSString *myQuote = self.myQuotes[index];
//    // 4 - Display the quote in the text view
//    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@", myQuote];
    
//    // 1 - Get number of rows in array
//    int arrayCount = (int)[self.movieQuotes count];
//    // 2 - Get random index
//    int index = arc4random() % arrayCount;
//    // 3 - Get the quote string for the index
//    NSString *myQuote = self.movieQuotes[index][@"quote"];
//    // 4 - Display the quote in the text view
//    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@", myQuote];
    
    // 1 - Get the personal quotes when the final segment is selected
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        int arraryCount = (int)[self.myQuotes count];
        int index = arc4random() % arraryCount;
        NSString *myQuote = self.myQuotes[index];
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",myQuote];
    } else {
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1) {
            selectedCategory = @"modern";
        }
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@",selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        
        int arraryCount = (int)[filteredArray count];
        if (arraryCount > 0) {
            int index = arc4random() % arraryCount;
            NSString *quote = filteredArray[index][@"quote"];
            NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
            if ([source length] != 0) {
                quote = [NSString stringWithFormat:@"%@\n\n(%@)",quote,source];
            }
            if ([selectedCategory isEqualToString:@"classic"]) {
                quote = [NSString stringWithFormat:@"From classic Movie\n\n%@", quote];
            } else {
                quote = [NSString stringWithFormat:@"Movie quote: \n\n%@", quote];
            }
            
            self.quoteText.text = quote;
//            self.quoteText.text = [NSString stringWithFormat:@"Movie Quote:\n\n%@", quote];
        } else {
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display"];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
