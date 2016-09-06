//
//  GCDTimer.m
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "GCDTimer.h"
static dispatch_time_t when;
static dispatch_queue_t queue;
static dispatch_source_t timer;
@implementation GCDTimer

/**
 *  一次性定时器，只执行一次
 *
 *  @param block <#block description#>
 */
+(void)timeOnce:(void(^)())block timeInterval:(NSTimeInterval)timeInterval{
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC*timeInterval));
    dispatch_after(when, queue, block);
}

/**
 *  重复定时器
 *
 *  @param block        <#block description#>
 *  @param timeInterval <#timeInterval description#>
 */
+(void)timeScheduled:(void(^)())block timeInterval:(NSTimeInterval)timeInterval{
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC));
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, when, (uint64_t)(NSEC_PER_SEC*timeInterval), 0);
    dispatch_source_set_event_handler(timer, block);
    dispatch_resume(timer);
}
/**
 *  销毁定时器
 */
+(void)timeInvalidate{
    dispatch_cancel(timer);
}
@end
