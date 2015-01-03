//
//  ViewController.m
//  Tap Me
//
//  Created by yww on 14/12/30.
//  Copyright (c) 2014年 zju. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    IBOutlet UILabel *timerLabel;
    IBOutlet UILabel *scoreLabel;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    //Add these  AVAudioPlayer objects!
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time"]];
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    
    [self setupGame];
}

- (void)setupGame {
    seconds = 30;
    count = 0;
    
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
    
    timerLabel.text = [NSString stringWithFormat:@"Timer:%li",(long)seconds];
    scoreLabel.numberOfLines = 0;
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li",(long)count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
}

- (void)subtractTime {
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time:%li",(long)seconds];
    
    [secondBeep play];
    
    if (seconds == 0) {
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %li points",(long)count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}

- (IBAction)buttonPressed:(id)sender {
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li",(long)count];
    
    [buttonBeep play];
}

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type {
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    return audioPlayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
