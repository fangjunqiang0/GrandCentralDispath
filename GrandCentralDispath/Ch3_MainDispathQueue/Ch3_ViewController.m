//
//  Ch3_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch3_ViewController.h"

@interface Ch3_ViewController ()

@end

@implementation Ch3_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     获取系统标准提供的Dispatch Queue，就是Main Dispatch Queue和Global Dispatch Queue
     Main Dispatch Queue就是在主线程中执行的，主线程只有1个，显然为Serial Dispatch Queue，这与NSObject类中performSelectorOnMainThread实例方法相同；
     Global Dispatch Queue是所有应用程序都能使用的Concurrent Dispatch Queue。没有必要通过dispath_queue_create()逐个生成。只要获取Global Dispatch Queue即可；
     Global Dispath Queue有4个执行优先级。分别是 高优先级（High Priority）、默认优先级（Default Priority）、低优先级（Low Priority）和后台优先级（Background Priority）
     注：
     通过XNU内核用于Global Dispatch Queue的线程并不能保证实时性，因此执行优先级只是大致判断。
     */
    [self mainDispatchQueueAndGlobalDispatchQueue];
    
    /*
     例子2
     Main Dispatch Queue和Global Dispatch Queue的使用
     */
    [self mainGlobalDispatchQueue];
    
    self.textView.text = @"例子1\n获取系统标准提供的Dispatch Queue，就是Main Dispatch Queue和Global Dispatch Queue\nMain Dispatch Queue就是在主线程中执行的，主线程只有1个，显然为Serial Dispatch Queue，这与NSObject类中performSelectorOnMainThread实例方法相同；\nGlobal Dispatch Queue是所有应用程序都能使用的Concurrent Dispatch Queue。没有必要通过dispath_queue_create()逐个生成。只要获取Global Dispatch Queue即可；\n    Global Dispath Queue有4个执行优先级。分别是 高优先级（High Priority）、默认优先级（Default Priority）、低优先级（Low Priority）和后台优先级（Background Priority\n注：\n通过XNU内核用于Global Dispatch Queue的线程并不能保证实时性，因此执行优先级只是大致判断。\n例子2\nMain Dispatch Queue和Global Dispatch Queue的使用";
}

/**
 例子1 Main/Global Dispatch Queue
 */
- (void)mainDispatchQueueAndGlobalDispatchQueue {
    //Main Dispatch Queue的获取方法
    dispatch_queue_t mainDispatchQueue = dispatch_get_main_queue();
    
    //Global Dispatch Queue的获取方法（高优先级）
    dispatch_queue_t globalDispatchQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    //Global Dispatch Queue的获取方法（默认优先级）
    dispatch_queue_t globalDispatchQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //Global Diapatch Queue的获取方法（低优先级）
    dispatch_queue_t globalDispatchQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    //Global Dispatch Queue的获取方法（后台优先级）
    dispatch_queue_t globalDispatchQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    
    dispatch_async(mainDispatchQueue, ^{
        NSLog(@"mainDispatchQueue");
    });
    dispatch_async(globalDispatchQueueHigh, ^{
        NSLog(@"globalDispatchQueueHigh");
    });
    dispatch_async(globalDispatchQueueDefault, ^{
        NSLog(@"globalDispatchQueueDefault");
    });
    dispatch_async(globalDispatchQueueLow, ^{
        NSLog(@"globalDispatchQueueLow");
    });
    dispatch_async(globalDispatchQueueBackground, ^{
        NSLog(@"globalDispatchQueueBackground");
    });
}

/**
 例子2 Main/Global Dispatch Queue使用
 */
- (void)mainGlobalDispatchQueue {
    //在默认优先级的Global Dispatch Queue中执行block
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //可并行执行的处理
        
        //在Main Dispatch queue中执行Block
        dispatch_async(dispatch_get_main_queue(), ^{
            //只能在主线程中执行的处理
        });
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
