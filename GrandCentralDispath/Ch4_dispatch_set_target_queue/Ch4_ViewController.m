//
//  Ch4_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch4_ViewController.h"

@interface Ch4_ViewController ()

@end

@implementation Ch4_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     dispatch_set_target_queue()变更dispatch_queue_create()生成的Dispatch Queue的优先级
     dispatch_queue_create()函数生成的Dispatch Queue不管是Serial Dispatch Queue还是Concurrent Dispatch Queue，都使用与默认优先级Global Dispatch Queue相同执行优先级的线程。
     */
    [self dispatchSetTargetQueue];
    
    self.textView.text = @"例子1\n    dispatch_set_target_queue()变更dispatch_queue_create()生成的Dispatch Queue的优先级\n    dispatch_queue_create()函数生成的Dispatch Queue不管是Serial Dispatch Queue还是Concurrent Dispatch Queue，都使用与默认优先级Global Dispatch Queue相同执行优先级的线程。\ndispatch_set_target_queue() 参数说明\n    第一个参数 为更改优先级的Dispatch Queue\n    第二个参数 指定与要使用的执行优先级相同的 GLobal Dispatch Queue\n注：\n    第一个参数不可为Main Dispatch Queue和Global Dispatch Queue。因此只能是dispatch_queue_create（）生成的Dispatch Queue\n    在必须将不可并行执行的处理追加到多个Serial Dispatch Queue中时，如果使用dispatch_set_target_queue（）函数将目标制定为某一个Serial Dispatch Queue，即可防止处理并行执行";
}

- (void)dispatchSetTargetQueue {
    /*
     dispatch_set_target_queue() 参数说明
     第一个参数 为更改优先级的Dispatch Queue
     第二个参数 指定与要使用的执行优先级相同的 GLobal Dispatch Queue
     注：
     第一个参数不可为Main Dispatch Queue和Global Dispatch Queue。因此只能是dispatch_queue_create（）生成的Dispatch Queue
     在必须将不可并行执行的处理追加到多个Serial Dispatch Queue中时，如果使用dispatch_set_target_queue（）函数将目标制定为某一个Serial Dispatch Queue，即可防止处理并行执行
     */
    dispatch_queue_t mySerialDispathQueue = dispatch_queue_create("com.GrandCentralDispath.mySerialDispathQueue", NULL);
    dispatch_queue_t globalDispatchQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_set_target_queue(mySerialDispathQueue, globalDispatchQueueBackground);
    
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
