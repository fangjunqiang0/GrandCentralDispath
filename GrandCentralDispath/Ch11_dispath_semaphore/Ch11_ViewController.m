//
//  Ch11_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch11_ViewController.h"

@interface Ch11_ViewController ()

@end

@implementation Ch11_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     dispatch semaphore 是持有计数的信号，该计数是多线程编程中的计数类型信号。
     */
    self.textView.text = @"dispatch semaphore 是持有计数的信号，该计数是多线程编程中的计数类型信号。";
}
- (void)dispatchSemaphore {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /*
     生成 Dispatch Semaphore ，其计数初始值为“1”，保证可访问NSMutableArray类对象的线程同时只有一个；
     */
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    NSMutableArray *mArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 10000; i++) {
        dispatch_async(queue, ^{
            /*
             等待Dispatch Semaphore，一直等待，知道其计数值达到大于等于1；
             */
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            /*
             由于Dispatch Semaphore的计数值达到大于等于1，所以将dispatch semaphore的计数值减去1，dispatch_semaphore_wait函数执行返回。
             即执行到此时的Dispatch Semaphore 的计数值为“0”。由于可访问NSMutableArray类对象的线程只有1个，因此可以安全的进行更新。
             */
            [mArr addObject:[NSNumber numberWithInteger:i]];
            
            /*
             排他控制处理结束，所以通过dispatch_semaphore_signal函数将Dispatch Semaphore的计数值加1.
             如果有通过dispatch_semaphore_wait函数等待Dispatch Semaphore的计数值增加的线程，就由最先等待的线程执行。
             */
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
