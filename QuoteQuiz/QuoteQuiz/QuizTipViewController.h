//
//  QuizTipViewController.h
//  QuoteQuiz
//
//  Created by yww on 4/16/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QuizTipViewControllerDelegate;

@interface QuizTipViewController : UIViewController

@property (nonatomic, assign) id<QuizTipViewControllerDelegate> delegate;
@property (nonatomic, weak) IBOutlet UITextView *tipView;
@property (nonatomic, copy) NSString *tipText;

- (IBAction)doneAction:(id)sender;

@end

@protocol QuizTipViewControllerDelegate <NSObject>

- (void)quizTipDidFinish:(QuizTipViewController *)controller;

@end
