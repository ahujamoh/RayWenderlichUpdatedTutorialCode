//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by yww on 4/18/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWTRateView.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate, RWTRateViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) ScaryBugDoc *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet RWTRateView *rateView;

@property (nonatomic, strong) UIImagePickerController *picker;

- (IBAction)addPictureTapped:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;

@end

