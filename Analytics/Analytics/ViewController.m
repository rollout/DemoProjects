//
//  ViewController.m
//  Analytics
//
//  Created by Sergey Ilyevsky on 6/16/15.
//  Copyright (c) 2015 Rollout. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(demoMethodThatRequiresAnalytics) userInfo:nil repeats:YES];
}

- (void)demoMethodThatRequiresAnalytics
{
    NSLog(@"Entered demoMethodThatRequiresAnalytics");
}

@end
