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
    
    //开发者要做的只是定义想执行的任务并追加到适当的 Dispatch Queue中；
    //例1
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
    
    // Dispatch Queue的种类
    // Serial Dispatch Queue。等待现在执行中处理结束（串行）
    // Concurrent Dispath Queue 不等现在执行中处理结束（并发）
    
    //例2 串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    
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
    
    //例3 并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
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
