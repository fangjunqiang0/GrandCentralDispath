//
//  Ch9_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch9_ViewController.h"

@interface Ch9_ViewController ()

@end

@implementation Ch9_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     dispatch_apply函数是dispatch_sync函数和Dispatch Group的关联API。该函数按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理执行结束；
     */
    [self dispatchApply];
    /*
     例子2
     由于dispatch_apply函数也与dispatch_sync函数相同，会等待处理执行结束，因此推荐在Dispatch_async函数中非同步地执行dispatch_apply函数。
     */
    [self dispatchApply2];
    
    self.textView.text = @"例子1\n    dispatch_apply函数是dispatch_sync函数和Dispatch Group的关联API。该函数按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理执行结束；\ndispatch_apply参数说明\n    第一个参数为重复的次数；\n    第二个参数为追加对象的Dispatch Queue\n    第三个参数为追加的处理，带有参数的Block\n例子2\n    由于dispatch_apply函数也与dispatch_sync函数相同，会等待处理执行结束，因此推荐在Dispatch_async函数中非同步地执行dispatch_apply函数。";
}

/**
 例子1
 */
- (void)dispatchApply {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /*
     dispatch_apply参数说明
     第一个参数为重复的次数；
     第二个参数为追加对象的Dispatch Queue
     第三个参数为追加的处理，带有参数的Block
     */
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"dispatch%zu",index);
    });
    NSLog(@"done");
}

- (void)dispatchApply2 {
    
    NSArray *array = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_apply(array.count, queue, ^(size_t index) {
            NSLog(@"%zu:%@",index,[array objectAtIndex:index]);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"done");
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
