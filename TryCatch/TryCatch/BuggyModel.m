//
//  BuggyModel.m
//  TryCatch
//
//  Created by Sergey Ilyevsky on 4/22/15.
//  Copyright (c) 2015 Rollout. All rights reserved.
//

#import "BuggyModel.h"

@implementation BuggyModel {
    NSMutableArray *_dataArray;
}

- (id)init
{
    if(self = [super init]) {
        _dataArray = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)numberOfRows
{
    return _dataArray.count;
}

- (NSString *)stringAtIndex:(NSInteger)stringIndex
{
    return _dataArray[stringIndex];
}

- (void)reloadWithCompletionHandler:(void (^)())completionHandler
{
    // Here we simulate some slow non-atomic reloading of data
    [_dataArray removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for(int i = 0; i < 100; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"%d", rand()]];
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            completionHandler();
        });
    });
}

@end
