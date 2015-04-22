//
//  ViewController.m
//  TryCatch
//
//  Created by Sergey Ilyevsky on 4/22/15.
//  Copyright (c) 2015 Rollout. All rights reserved.
//

#import "ViewController.h"
#import "BuggyModel.h"

static NSString *const CellIdentifier=@"cell";

@interface ViewController()

@property (nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController {
    BuggyModel *_buggyModel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _buggyModel = [[BuggyModel alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    [self reloadData];
}

- (IBAction)reloadData
{
    [_buggyModel reloadWithCompletionHandler:^{
        [self.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _buggyModel.numberOfRows;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [_buggyModel stringAtIndex:indexPath.row];
    return cell;
}

@end
