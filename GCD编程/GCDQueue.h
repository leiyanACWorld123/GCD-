//
//  GCDQueue.h
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDGroup.h"

typedef NS_ENUM(NSInteger,GCDQueueType) {
    GCDQueueTypeAsync,//异步
    GCDQueueTypeSync//同步
};

@interface GCDQueue : NSObject

/**
 *  串队列初始化
 *
 *  @return <#return value description#>
 */
-(instancetype)initSerial;
/**
 *  并队列初始化
 *
 *  @return <#return value description#>
 */
-(instancetype)initConcurrent;

/**
 *  串队列线程
 *
 *  @param type  <#type description#>
 *  @param block <#block description#>
 */
-(void)serial:(GCDQueueType)type block:(void (^)())block;
/**
 *  并发队列线程
 *
 *  @param type  <#type description#>
 *  @param block <#block description#>
 */
-(void)concurrent:(GCDQueueType)type block:(void (^)())block;
/**
 *  开个异步子线程
 *
 *  @param block <#block description#>
 */
+(void)queueInGlobal:(void(^)())block;
/**
 *  开个同步子线程
 *
 *  @param block <#block description#>
 */
+(void)queueInMain:(void(^)())block;

/**
 *  异步子线程延时
 *
 *  @param block <#block description#>
 *  @param time  <#time description#>
 */
+(void)queueTimerInGlobal:(void(^)())block afterTimeThread:(NSTimeInterval)time;
/**
 *  同步子线程延时
 *
 *  @param block <#block description#>
 *  @param time  <#time description#>
 */
+(void)queueTimerIngMain:(void(^)())block afterTimeThread:(NSTimeInterval)time;
/**
 *  子线程组
 *
 *  @param block <#block description#>
 *  @param group <#group description#>
 */
-(void)execute:(void(^)())block inGroup:(GCDGroup *)group;
/**
 *  监听线程组结束后调取方法
 *
 *  @param block <#block description#>
 *  @param group <#group description#>
 */
-(void)notify:(void(^)())block inGroup:(GCDGroup *)group;
@end
