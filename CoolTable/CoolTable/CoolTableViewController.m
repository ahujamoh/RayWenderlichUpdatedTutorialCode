//
//  CoolTableViewController.m
//  CoolTable
//
//  Created by yww on 7/13/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "CoolTableViewController.h"
#import "CustomCellBackground.h"

@interface CoolTableViewController ()

@property (copy) NSMutableArray *thingsToLearn;
@property (copy) NSMutableArray *thingsLearned;

@end

@implementation CoolTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Core Graphics 101";
    self.thingsToLearn = [@[@"Drawing Rects", @"Drawing Gradients", @"Drawing Arcs"] mutableCopy];
    self.thingsLearned = [@[@"Table Views", @"UIKit", @"Objective-C"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.thingsToLearn.count;
    } else {
        return self.thingsLearned.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cennIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cennIdentifier forIndexPath:indexPath];
    NSString *entry;
    
    // START NEW
    if (![cell.backgroundView isKindOfClass:[CustomCellBackground class]]) {
        cell.backgroundView = [[CustomCellBackground alloc] init];
    }
    if (![cell.selectedBackgroundView isKindOfClass:[CustomCellBackground class]]) {
        cell.selectedBackgroundView = [[CustomCellBackground alloc] init];
    }
    
    if (indexPath.section == 0) {
        entry = self.thingsToLearn[indexPath.row];
    } else {
        entry = self.thingsLearned[indexPath.row];
    }
    
    cell.textLabel.text = entry;
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Things We'll Learn";
    } else {
        return @"Things Already Covered";
    }
}

@end
