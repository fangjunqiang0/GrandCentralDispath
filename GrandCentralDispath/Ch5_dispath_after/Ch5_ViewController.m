//
//  Ch5_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch5_ViewController.h"

@interface Ch5_ViewController ()

@end

@implementation Ch5_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     例子1
     dispatch_after（）函数可实现在指定的时间后执行处理的情况
     注：
     dispathc_after()并不是在指定时间后执行处理，而是指定时间追加处理到Dispatch Queue中。因为Main Dispatch Queue在主线程的RunLoop中执行，比如每隔1/60秒执行的RunLoop中，Block最快在3秒后执行，最面在1/60 + 3秒后执行（3秒为例子1中的时间），并且在Main Dispatch Queue有大量处理追加或主线程处理本身有延迟，这个时间回更长。
     */
    [self dispatchAfter];
    
    self.textView.text = @"例子1\n    dispatch_after（）函数可实现在指定的时间后执行处理的情况\n注：\n    dispathc_after()并不是在指定时间后执行处理，而是指定时间追加处理到Dispatch Queue中。因为Main Dispatch Queue在主线程的RunLoop中执行，比如每隔1/60秒执行的RunLoop中，Block最快在3秒后执行，最面在1/60 + 3秒后执行（3秒为例子1中的时间），并且在Main Dispatch Queue有大量处理追加或主线程处理本身有延迟，这个时间回更长。\ndispatch_after()函数参数说明\n    第一个参数是指定时间用的dispatch_time_t类型的值，该值使用dispatch_time函数或dispatch_walltime函数生成；\n    第二个参数指定要追加处理的Dispatch Queue；\n    第三个参数指定要执行处理的Block";
}

/**
 例子1
 */
- (void)dispatchAfter {
    /*
     dispatch_after()函数参数说明
     第一个参数是指定时间用的dispatch_time_t类型的值，该值使用dispatch_time函数或dispatch_walltime函数生成；
     第二个参数指定要追加处理的Dispatch Queue；
     第三个参数指定要执行处理的Block
     */
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"waited at least three seconds");
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"waited at least three seconds");
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
