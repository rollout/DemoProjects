//
//  BuggyModel.h
//  TryCatch
//
//  Created by Sergey Ilyevsky on 4/22/15.
//  Copyright (c) 2015 Rollout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuggyModel : NSObject

- (NSInteger)numberOfRows;
- (NSString*)stringAtIndex:(NSInteger)stringIndex;
- (void)reloadWithCompletionHandler:(void (^)())completionHandler;

@end
