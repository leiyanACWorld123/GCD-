//
//  GCDGroup.m
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "GCDGroup.h"

@implementation GCDGroup
static dispatch_group_t group;
-(instancetype)init{
    if(self = [ super init]){
        group = dispatch_group_create();
    }
    return self;
}
-(void)execute:(dispatch_queue_t)queue block:(void(^)())block{
    dispatch_group_async(group, queue, block);
}
-(void)notify:(dispatch_queue_t)queue block:(void(^)())block{
    dispatch_group_notify(group, queue, block);
}
@end
