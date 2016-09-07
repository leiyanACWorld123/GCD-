//
//  GCDGroup.h
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDGroup : NSObject

-(void)execute:(dispatch_queue_t)queue block:(void(^)())block;
-(void)notify:(dispatch_queue_t)queue block:(void(^)())block;
@end
