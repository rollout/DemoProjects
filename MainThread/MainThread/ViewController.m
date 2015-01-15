//
//  ViewController.m
//  MainThread
//
//  Created by Sergey Ilyevsky on 1/15/15.
//  Copyright (c) 2015 DeDoCo. All rights reserved.
//


#import "ViewController.h"

NSString *const ViewController_DataLoadedNotification = @"DataLoadedNotification";
NSString *const ViewController_cellId = @"cellId";

@interface ViewController () {
    int _counter;
}

@property (nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDataLoadedNotification) name:ViewController_DataLoadedNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ViewController_cellId];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleDataLoadedNotification
{
    [self.tableView reloadData];
}

- (IBAction)handleButtonClicked
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _counter += 10;
        [[NSNotificationCenter defaultCenter] postNotificationName:ViewController_DataLoadedNotification object:nil];
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ViewController_cellId];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", _counter + indexPath.row];
    return cell;
}

@end