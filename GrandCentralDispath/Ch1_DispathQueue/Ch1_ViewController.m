//
//  Ch1_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch1_ViewController.h"

@interface Ch1_ViewController ()

@end

@implementation Ch1_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //苹果官方对GCD的说明：开发者要做的只是定义想执行的任务并追加到适当的 Dispatch Queue中 例子1
    [self mainQueue];
    
    // Dispatch Queue的种类
    // Serial Dispatch Queue。等待现在执行中处理结束（串行）例子2
    [self serialQueue];
    
    
    // Concurrent Dispath Queue 不等现在执行中处理结束（并发）例子3
    [self concurrentQueue];
    
   /*
    总结
    本例子，主要说明三个问题：
    1、Dispatch Queue 是什么？字面意思是“派发队列”，如字面意思，是执行处理的的等待队列。开发人员通过dispatch_aysnc等函数API，在Block里面记述想执行处理并追加到Dispatch queue中。Dispatch Queue按照追加的顺序（先进先出FIFO，first in first out）执行处理。例子1
    2、串行队列，就是等前一个队列执行完毕才执行下一个队列。我们可以通过例子2的打印结果，看出serialQueue0-9的打印顺序是正序排列的。
    3、并发队列，每一个队列执行不用等待其他队列是否执行完毕。我们可以通过例子3的打印结果，看出concurrentQueue0-9的打印顺序是混乱的。
    注：
    串行队列使用一个线程
    并发队列使用多个线程，XNU核心决定应当使用的线程数量，执行顺序回根据执行内容及系统状态发生改变。（多次执行例子3即可看出）
    dispatch_async()、dispatch_get_main_queue()、dispatch_queue_create()此处不做解释。
    */
    
    self.textView.text = @"总结\n本例子，主要说明三个问题：\n1、Dispatch Queue 是什么？字面意思是“派发队列”，如字面意思，是执行处理的的等待队列。开发人员通过dispatch_aysnc等函数API，在Block里面记述想执行处理并追加到Dispatch queue中。Dispatch Queue按照追加的顺序（先进先出FIFO，first in first out）执行处理。例子1\n2、串行队列，就是等前一个队列执行完毕才执行下一个队列。我们可以通过例子2的打印结果，看出serialQueue0-9的打印顺序是正序排列的。\n3、并发队列，每一个队列执行不用等待其他队列是否执行完毕。我们可以通过例子3的打印结果，看出concurrentQueue0-9的打印顺序是混乱的。\n注：\n串行队列使用一个线程\n并发队列使用多个线程，XNU核心决定应当使用的线程数量，执行顺序回根据执行内容及系统状态发生改变。（多次执行例子3即可看出）\ndispatch_async()、dispatch_get_main_queue()、dispatch_queue_create()此处不做解释。";

}

/**
 例1
 */
- (void)mainQueue {
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        /*
         想要执行的任务
         长时间处理
         例如AR用画像识别
         例如数据库访问
         */
        NSLog(@"这个是例子1");
    });
}

/**
 例2 串行队列
 */
- (void)serialQueue {
    //参数DISPATCH_QUEUE_SERIAL 表示生成的队列为串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("com.GrandCentralDispath.serialQueue", DISPATCH_QUEUE_SERIAL);

    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue0");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue1");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue2");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue3");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue4");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue5");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue6");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue7");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue8");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"serialQueue9");
    });
}

/**
 例3 并发队列
 */
- (void)concurrentQueue {
    //DISPATCH_QUEUE_CONCURRENT 表示生成的队列为并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.GrandCentralDispath.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue0");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue1");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue2");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue3");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue4");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue5");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue6");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue7");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue8");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"concurrentQueue9");
    });
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
