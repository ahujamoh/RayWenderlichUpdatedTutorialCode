//
//  QuoteQuizViewController.m
//  QuoteQuiz
//
//  Created by yww on 4/16/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import "QuoteQuizViewController.h"
#import "Quiz.h"

@interface QuoteQuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answer1Label;
@property (nonatomic, weak) IBOutlet UILabel *answer2Label;
@property (nonatomic, weak) IBOutlet UILabel *answer3Label;
@property (nonatomic, weak) IBOutlet UIButton *answer1Button;
@property (nonatomic, weak) IBOutlet UIButton *answer2Button;
@property (nonatomic, weak) IBOutlet UIButton *answer3Button;
@property (nonatomic, weak) IBOutlet UIImageView *movie1;
@property (nonatomic, weak) IBOutlet UIImageView *movie2;
@property (nonatomic, weak) IBOutlet UIImageView *movie3;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UIButton *startButton;
@property (nonatomic, weak) IBOutlet UIButton *infoButton;

@property (nonatomic, assign) NSInteger answer;

@end

@implementation QuoteQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.quizIndex = 999;
    self.quiz = [[Quiz alloc] initWithQuiz:@"quotes"];
    
    [self nextQuizItem];
}

- (void)nextQuizItem
{
    if (self.quizIndex == 999) {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    } else if ((self.quiz.quizCount - 1) > self.quizIndex) {
        self.quizIndex++;
    } else {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    }
    
    if (self.quiz.quizCount >= self.quizIndex + 1) {
        [self.quiz nextQuestion:self.quizIndex];
        self.questionLabel.text = self.quiz.quote;
        self.answer1Label.text = self.quiz.ans1;
        self.answer2Label.text = self.quiz.ans2;
        self.answer3Label.text = self.quiz.ans3;
    } else {
        self.quizIndex = 0;
        [self quizDone];
    }
    
    // reset fields for next question
    self.answer1Label.backgroundColor = [UIColor colorWithRed:41/255.0 green:165/255.0 blue:255/255.0 alpha:1.0];
    self.answer2Label.backgroundColor = [UIColor colorWithRed:41/255.0 green:165/255.0 blue:255/255.0 alpha:1.0];
    self.answer3Label.backgroundColor = [UIColor colorWithRed:41/255.0 green:165/255.0 blue:255/255.0 alpha:1.0];
    
    self.answer1Button.hidden = NO;
    self.answer2Button.hidden = NO;
    self.answer3Button.hidden = NO;
    
    if (self.quiz.tipCount < 3) {
        self.infoButton.hidden = NO;
    } else {
        self.infoButton.hidden = YES;
    }
}

- (void)checkAnswer
{
    if ([self.quiz checkQuestion:self.quizIndex forAnswer:_answer]) {
        if (self.answer == 1) {
            self.answer1Label.backgroundColor = [UIColor greenColor];
        } else  if(self.answer == 2) {
            self.answer2Label.backgroundColor = [UIColor greenColor];
        } else if(self.answer == 3) {
            self.answer3Label.backgroundColor = [UIColor greenColor];
        }
    } else {
        if (self.answer == 1) {
            self.answer1Label.backgroundColor = [UIColor redColor];
        } else  if(self.answer == 2) {
            self.answer2Label.backgroundColor = [UIColor redColor];
        } else if(self.answer == 3) {
            self.answer3Label.backgroundColor = [UIColor redColor];
        }
    }
    
    self.statusLabel.text = [NSString stringWithFormat:@"Correct: %ld Incorrect: %ld",self.quiz.correctCount, self.quiz.incorrectCount];
    
    self.answer1Button.hidden = YES;
    self.answer2Button.hidden = YES;
    self.answer3Button.hidden = YES;
    
    self.startButton.hidden = NO;
    
    [self.startButton setTitle:@"Next" forState:UIControlStateNormal];
}

- (IBAction)ans1Action:(id)sender
{
    self.answer = 1;
    [self checkAnswer];
}

- (IBAction)ans2Action:(id)sender
{
    self.answer = 2;
    [self checkAnswer];
}

- (IBAction)ans3Action:(id)sender
{
    self.answer = 3;
    [self checkAnswer];
}

- (IBAction)startAgain:(id)sender
{
    [self nextQuizItem];
}

- (void)quizDone
{
    if (self.quiz.correctCount) {
        self.statusLabel.text = [NSString stringWithFormat:@"Quiz Done - Score %ld%%", self.quiz.quizCount/self.quiz.correctCount];
    } else {
        self.statusLabel.text = @"Quiz Done - Score: 0%";
    }
    [self.startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    self.quizIndex = 999;
}

#pragma mark - QuizTipViewController
- (void)quizTipDidFinish:(QuizTipViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - present segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TipModal"]) {
        QuizTipViewController *detailViewController = segue.destinationViewController;
        detailViewController.delegate = self;
        detailViewController.tipText = self.quiz.tip;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
