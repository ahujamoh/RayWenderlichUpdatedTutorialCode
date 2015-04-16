//
//  QuoteQuizViewController.h
//  QuoteQuiz
//
//  Created by yww on 4/16/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizTipViewController.h"
@class Quiz;

@interface QuoteQuizViewController : UIViewController <QuizTipViewControllerDelegate>

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) Quiz *quiz;

- (IBAction)ans1Action:(id)sender;
- (IBAction)ans2Action:(id)sender;
- (IBAction)ans3Action:(id)sender;
- (IBAction)startAgain:(id)sender;

@end
