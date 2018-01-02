//
//  Ch6_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch6_ViewController.h"

@interface Ch6_ViewController ()

@end

@implementation Ch6_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     Dispatch Group 用于解决追加到Concurrent Dispatch Queue中的多个处理全部结束后想执行结束处理的情况。
     */
    [self dispatchGroup];
    
    self.textView.text = @"例子1\n    Dispatch Group 用于解决追加到Concurrent Dispatch Queue中的多个处理全部结束后想执行结束处理的情况。\n    dispatch_group_create()函数生成dispatch_group_t类型的Dispatch Group；\n    dispathc_group_async()函数与dispatch_async()函数一样\ndispatch_group_notify()介绍\n    追加到Dispatch Group中的处理全部执行结束时，dispatch_group_notify()函数会将执行的Block追加到Dispatch Queue中；\n    dispatch_group_notify()参数说明\n    第一个参数为要监视的Dispatch Group\n    在追加到该Dispatch Group的处理全部执行结束时，第三个参数的Block追加到第二个参数的Dispatch Queue中\ndispatch_group_wait()介绍\n    dispatch_group_wait()函数仅等待全部处理结束，返回值为long型。\n    第一个参数为要监视的Dispatch Group\n    第二个参数指定等待的时间（超时），属于dispatch_time_t类型\n注：\n    DISPATCH_TIME_FOREVER 表示永远等待\n    DISPATCH_TIME_NOW 表示不用等待";
}

/**
 例子1
 */
- (void)dispatchGroup {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    /*
     dispatch_group_create()函数生成dispatch_group_t类型的Dispatch Group；
     */
    dispatch_group_t group = dispatch_group_create();
    
    /*
     dispathc_group_async()函数与dispatch_async()函数一样
     */
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async0");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async2");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async3");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async4");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async5");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async6");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async7");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async8");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async9");
    });
    /*
     dispatch_group_notify()介绍
     追加到Dispatch Group中的处理全部执行结束时，dispatch_group_notify()函数会将执行的Block追加到Dispatch Queue中；
     dispatch_group_notify()参数说明
     第一个参数为要监视的Dispatch Group
     在追加到该Dispatch Group的处理全部执行结束时，第三个参数的Block追加到第二个参数的Dispatch Queue中
     */
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"done0");
    });
    /*
     dispatch_group_wait()介绍
     dispatch_group_wait()函数仅等待全部处理结束，返回值为long型。
     第一个参数为要监视的Dispatch Group
     第二个参数指定等待的时间（超时），属于dispatch_time_t类型
     注：
     DISPATCH_TIME_FOREVER 表示永远等待
     DISPATCH_TIME_NOW 表示不用等待
     */
    long result = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    if (result == 0) {
        //属于Dispatch Group的全部处理执行结束
        NSLog(@"done1");
    }
    else{
        //属于Dispatch Group的某一处理还在执行中
        NSLog(@"ing");
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
