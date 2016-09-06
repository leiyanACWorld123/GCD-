//
//  ViewController.m
//  GCD编程
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 }

/**
 *  串行队列
 */
-(void)Serial{
    GCDQueue *gcdSerial = [[GCDQueue alloc]initSerial];
    [gcdSerial serial:GCDQueueTypeAsync block:^{
        NSLog(@"1");
    }];
    [gcdSerial serial:GCDQueueTypeAsync block:^{
        NSLog(@"2");
    }];
    [gcdSerial serial:GCDQueueTypeAsync block:^{
        NSLog(@"3");
    }];
    [gcdSerial serial:GCDQueueTypeAsync block:^{
        NSLog(@"4");
    }];
    [gcdSerial serial:GCDQueueTypeAsync block:^{
        NSLog(@"5");
    }];
    [gcdSerial serial:GCDQueueTypeAsync block:^{
        NSLog(@"6");
    }];
}

/**
 *  并发队列
 */
-(void)Concurrent{
    GCDQueue *gcdConcurrent = [[GCDQueue alloc]initConcurrent];
    [gcdConcurrent concurrent:GCDQueueTypeAsync block:^{
        NSLog(@"1");
    }];
    [gcdConcurrent concurrent:GCDQueueTypeAsync block:^{
        NSLog(@"2");
    }];
    [gcdConcurrent concurrent:GCDQueueTypeAsync block:^{
        NSLog(@"3");
    }];
    [gcdConcurrent concurrent:GCDQueueTypeAsync block:^{
        NSLog(@"4");
    }];
    [gcdConcurrent concurrent:GCDQueueTypeAsync block:^{
        NSLog(@"5");
    }];
    [gcdConcurrent concurrent:GCDQueueTypeAsync block:^{
        NSLog(@"6");
    }];
}

/**
 *  延时线程
 */
-(void)afterTime{
    [GCDQueue queueTimerIngMain:^{
        NSLog(@"主线程1s thread");
    } afterTimeThread:2];
    
    [GCDQueue queueTimerInGlobal:^{
        NSLog(@"子线程1s thread");
    } afterTimeThread:1];
}

/**
 *  线程组
 */
-(void)group{
    GCDQueue *queue = [[GCDQueue alloc]initConcurrent];
    GCDGroup *group = [[GCDGroup alloc]init];
    [queue execute:^{
        sleep(1);
        NSLog(@"1");
    } inGroup:group];
    
    [queue execute:^{
//        sleep(3);
        NSLog(@"2");
    } inGroup:group];
    
    [queue notify:^{
        NSLog(@"3");
    } inGroup:group];
}

/**
 *  定时器
 */
-(void)timer{
    [GCDTimer timeOnce:^{
        NSLog(@"1");
    } timeInterval:2];
    
    static int count = 0;
    [GCDTimer timeScheduled:^{
        NSLog(@"1");
        count++;
        if(count == 5){
            [GCDTimer timeInvalidate];
        }
    } timeInterval:1];

}

/**
 *  信号量
 */
-(void)semaphoreMethod{
    Semaphore *semaphore = [[Semaphore alloc]init];
    [GCDQueue queueInGlobal:^{
        NSLog(@"1");
        [semaphore signal];
    }];
    [GCDQueue queueInGlobal:^{
        [semaphore wait];
        NSLog(@"2");
    }];
}
@end
