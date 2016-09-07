//
//  GCDTimer.h
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDTimer : NSObject

/**
 *  一次性定时器，只执行一次
 *
 *  @param block <#block description#>
 */
+(void)timeOnce:(void(^)())block timeInterval:(NSTimeInterval)timeInterval;

/**
 *  重复定时器
 *
 *  @param block        <#block description#>
 *  @param timeInterval <#timeInterval description#>
 */
+(void)timeScheduled:(void(^)())block timeInterval:(NSTimeInterval)timeInterval;
/**
 *  销毁定时器
 */
+(void)timeInvalidate;
@end
