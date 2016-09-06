//
//  Semaphore.h
//  GCD编程
//
//  Created by apple on 16/9/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Semaphore : NSObject

/**
 *  发送信号
 */
-(void)signal;
/**
 *  等待信号
 */
-(void)wait;
@end
