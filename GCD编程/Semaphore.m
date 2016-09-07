//
//  Semaphore.m
//  GCD编程
//
//  Created by apple on 16/9/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "Semaphore.h"

static dispatch_semaphore_t semaphore;
static dispatch_queue_t queue;
@implementation Semaphore

-(instancetype)init{
    if(self = [super init]){
        semaphore = dispatch_semaphore_create(0);
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    return self;
}

-(void)signal{
    dispatch_semaphore_signal(semaphore);
}

-(void)wait{
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}
@end
