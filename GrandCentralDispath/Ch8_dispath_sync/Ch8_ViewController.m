//
//  Ch8_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch8_ViewController.h"

@interface Ch8_ViewController ()

@end

@implementation Ch8_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     dispatch_async与dispatch_sync
     dispatch_async()函数的“asyc”意味着“非同步”（asynchronous），就是将指定的Block“非同步”地追加到指定的Dispatch Queue中。dispatch_async函数不做任何等待；
     dispatch_sync()函数意味着“同步”（asynchronous）,也即是将指定的Block“同步”追加到指定的Dispatch Queue中。在追加Block结束之前，dispatch_sync函数会一直等待；
     注：例子2、3、4会发生异常，死锁。
     */
    self.textView.text = @"例子1\ndispatch_async与dispatch_sync\n    dispatch_async()函数的“asyc”意味着“非同步”（asynchronous），就是将指定的Block“非同步”地追加到指定的Dispatch Queue中。dispatch_async函数不做任何等待；\n    dispatch_sync()函数意味着“同步”（asynchronous）,也即是将指定的Block“同步”追加到指定的Dispatch Queue中。在追加Block结束之前，dispatch_sync函数会一直等待；\n注：例子2、3、4会发生异常，死锁。";
}

/**
 例子1
 */
- (void)dispatchSync {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        //处理
        NSLog(@"dispatchSync");
    });
}
/**
 例子2
 */
- (void)dispathcSync2 {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"发生死锁");
    });
}

/**
 例子3
 */
- (void)dispathcSync3 {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        dispatch_sync(queue, ^{
            NSLog(@"发生死锁");
        });
    });
    
}

/**
 例子4
 */
- (void)dispathcSync4 {
    dispatch_queue_t queue = dispatch_queue_create("com.GrandCentralDispath.dispathSync", NULL );
    dispatch_async(queue, ^{
        dispatch_sync(queue, ^{
            NSLog(@"发生死锁");
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
