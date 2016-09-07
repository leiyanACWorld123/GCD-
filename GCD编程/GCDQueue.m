//
//  GCDQueue.m
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "GCDQueue.h"

@interface GCDQueue()
@end
@implementation GCDQueue
static dispatch_queue_t queue;

-(instancetype)initSerial{
    if(self = [super init]){
        queue = dispatch_queue_create("ly", NULL);
    }
    return self;
}
-(instancetype)initConcurrent{
    if(self = [super init]){
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    return self;
}

-(void)serial:(GCDQueueType)type block:(void (^)())block{
    switch (type) {
        case GCDQueueTypeAsync:
            dispatch_async(queue, block);
            break;
        case GCDQueueTypeSync:
            dispatch_sync(queue, block);
            break;
        default:
            break;
    }
}
-(void)concurrent:(GCDQueueType)type block:(void (^)())block{
    switch (type) {
        case GCDQueueTypeAsync:
            dispatch_async(queue, block);
            break;
        case GCDQueueTypeSync:
            dispatch_sync(queue, block);
            break;
        default:
            break;
    }
}
-(void)execute:(void(^)())block inGroup:(GCDGroup *)group{
    [group execute:queue block:block];
}
-(void)notify:(void(^)())block inGroup:(GCDGroup *)group{
    [group notify:queue block:block];
}

+(void)queueInMain:(void (^)())block{
    static dispatch_queue_t queue;
    queue = dispatch_get_main_queue();
    dispatch_sync(queue, block);
}
+(void)queueInGlobal:(void(^)())block{
    static dispatch_queue_t queue;
    queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, block);
}
+(void)queueInGlobalSync:(void(^)())block{
   static dispatch_queue_t queue;
   queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, block);
}
+(void)queueTimerInGlobal:(void(^)())block afterTimeThread:(NSTimeInterval)time{
    static dispatch_queue_t queue;
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC));
    dispatch_after(when, queue, block);
}
+(void)queueTimerIngMain:(void(^)())block afterTimeThread:(NSTimeInterval)time{
    static dispatch_queue_t queue;
    queue = dispatch_get_main_queue();
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC));
    dispatch_after(when, queue, block);
}
@end
