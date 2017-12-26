//
//  Ch2_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch2_ViewController.h"

@interface Ch2_ViewController ()

@end

@implementation Ch2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取Dispatch queue的方法有两种，分别为通过GCD的API和系统提供的。这里讲解通过GCD的API方式，系统提供的方式在“Ch3_MainDispatchQueue”讲解
    
    //例子1 通过dispatch_queue_crete()函数生成Dispatch Queue
    [self serialDispathQueueCreate];
    /*
     注：关于Serial Dispatch Queue生成个数的问题
     通过dispatch_queue_crete()生成多个Serial Dispatch Queue时，各个Serial Dispatch Queue将并行执行（并发队列）,查看例子1的打印日志
     */
    
    //例子2 dispatch_queue_crete()函数 参数说明
    [self dispatchQueueCreateParameter];
    /*
     注：关于线程的内存管理 iOS7以后的系统ARC自动管理
     释放：dispatch_release()  保留：dispath_retain()
     */
    
}

/**
 例子1
 */
- (void)serialDispathQueueCreate {
    //dispatch_queue_create() 函数使用
    dispatch_queue_t mySerialQueue0 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue0", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue1 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue2 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue3 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue3", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue4 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue4", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue5 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue5", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue6 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue6", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue7 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue7", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue8 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue8", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mySerialQueue9 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue9", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(mySerialQueue0, ^{
        NSLog(@"mySerialQueue0");
    });
    dispatch_async(mySerialQueue1, ^{
        NSLog(@"mySerialQueue1");
    });
    dispatch_async(mySerialQueue2, ^{
        NSLog(@"mySerialQueue2");
    });
    dispatch_async(mySerialQueue3, ^{
        NSLog(@"mySerialQueue3");
    });
    dispatch_async(mySerialQueue4, ^{
        NSLog(@"mySerialQueue4");
    });
    dispatch_async(mySerialQueue5, ^{
        NSLog(@"mySerialQueue5");
    });
    dispatch_async(mySerialQueue6, ^{
        NSLog(@"mySerialQueue6");
    });
    dispatch_async(mySerialQueue7, ^{
        NSLog(@"mySerialQueue7");
    });
    dispatch_async(mySerialQueue8, ^{
        NSLog(@"mySerialQueue8");
    });
    dispatch_async(mySerialQueue9, ^{
        NSLog(@"mySerialQueue9");
    });
}

/**
 例子2
 */
- (void)dispatchQueueCreateParameter {
    /*
     dispatch_queue_create() 函数参数说明
     第一参数，指定Dispatch queue 的名称，推荐使用应用程序ID这种全程域名,例如："com.GrandCentralDispath.mySerialQueue0"。改名称在Xcode和Instruments的调试器中作为Dispatch Queue名称表示。（可加一个断点查看）。
     第二个参数，传NUll或DISPATCH_QUEUE_SERIAL 生成 Serial Dispatch Queue（串行队列）
            传DISPATCH_QUEUE_CONCURRENT 生成 Concurrent Dispatch Queue（并发队列）
     */
    
    dispatch_queue_t mySerialQueue10 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue10", NULL);//串行队列
    dispatch_queue_t mySerialQueue11 = dispatch_queue_create("com.GrandCentralDispath.mySerialQueue11", DISPATCH_QUEUE_SERIAL);//串行队列
    dispatch_queue_t myConcurrentQueue0 = dispatch_queue_create("com.GrandCentralDispath.myConcurrentQueue0", DISPATCH_QUEUE_CONCURRENT);//并发队列
    
    dispatch_async(mySerialQueue10, ^{
        NSLog(@"mySerialQueue10");
        
    });
    dispatch_async(mySerialQueue11, ^{
        NSLog(@"mySerialQueue11");
    });
    dispatch_async(myConcurrentQueue0, ^{
        NSLog(@"myConcurrentQueue0");
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
