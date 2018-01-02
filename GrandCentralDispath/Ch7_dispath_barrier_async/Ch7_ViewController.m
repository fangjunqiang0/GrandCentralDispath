//
//  Ch7_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch7_ViewController.h"

@interface Ch7_ViewController ()

@end

@implementation Ch7_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     为高效率的执行处理，处理追加到Concurrent Dispatch Queue中，但我们想在某些处理执行完后（不是所有执行结束）执行其他操作。 虽然Dispatch Group和dispatch_set_target_queue可以实现，但是GCD为我们提供了更为聪明的解决方法——dispatch_barrier_async()函数。该函数同dispatch_queue_create()函数生成的Concurrent Dispatch Queue一起使用。
     */
    [self dispatchBarrierAsync];
    self.textView.text = @"例子1\n    为高效率的执行处理，处理追加到Concurrent Dispatch Queue中，但我们想在某些处理执行完后（不是所有执行结束）执行其他操作。 虽然Dispatch Group和dispatch_set_target_queue可以实现，但是GCD为我们提供了更为聪明的解决方法——dispatch_barrier_async()函数。该函数同dispatch_queue_create()函数生成的Concurrent Dispatch Queue一起使用。\n dispatch_barrier_async()介绍\n    dispatch_barrier_async()函数会等待追加到Concurrent Dispatch Queue上的并行执行的处理全部结束之后，再将指定的处理追加到改Concurrent Dispatch Queue中。然后在由dispatch_barrier_async（）函数追加到处理执行完毕后，Concurrent Dispatch Queue才恢复为一般的动作，追加到该Concurrent Dispatch Queue的处理又开始并行执行；\n    简单理解：先dispatch_barrier_async（）之前的并发执行先执行，在执行dispatch_barrier_async（），最后dispatch_barrier_async（）之后的并发再执行；";
}

/**
 例子1
 */
- (void)dispatchBarrierAsync {
    dispatch_queue_t queue = dispatch_queue_create("com.GrandCentralDispath.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"queue0");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue1");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue2");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue3");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue4");
    });
    /*
     dispatch_barrier_async()介绍
     dispatch_barrier_async()函数会等待追加到Concurrent Dispatch Queue上的并行执行的处理全部结束之后，再将指定的处理追加到改Concurrent Dispatch Queue中。然后在由dispatch_barrier_async（）函数追加到处理执行完毕后，Concurrent Dispatch Queue才恢复为一般的动作，追加到该Concurrent Dispatch Queue的处理又开始并行执行；
     简单理解：先dispatch_barrier_async（）之前的并发执行先执行，在执行dispatch_barrier_async（），最后dispatch_barrier_async（）之后的并发再执行；
     */
    dispatch_barrier_async(queue, ^{
        NSLog(@"dispatchBarrierAsync");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue5");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue6");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue7");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue8");
    });
    dispatch_async(queue, ^{
        NSLog(@"queue9");
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
