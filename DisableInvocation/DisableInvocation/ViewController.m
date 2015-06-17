//
//  ViewController.m
//  DisableInvocation
//
//  Created by Sergey Ilyevsky on 6/17/15.
//  Copyright (c) 2015 Rollout. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)handleButtonClick
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSLog(@"This is iPad, crashing...");
        NSLog(@"%d", *(int*)123);
    } else {
        NSLog(@"This is iPhone");
    }
}

@end
