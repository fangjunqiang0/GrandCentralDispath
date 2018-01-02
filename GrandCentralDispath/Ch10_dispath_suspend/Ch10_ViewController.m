//
//  Ch10_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch10_ViewController.h"

@interface Ch10_ViewController ()

@end

@implementation Ch10_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     dispatch_suspend函数挂起指定的Dispatch Queue
     dispatch_resume函数恢复指定的Dispatch Queue
     */
    [self dispatchSuspendAndResume];
    self.textView.text = @"例子1\n    dispatch_suspend函数挂起指定的Dispatch Queue\n    dispatch_resume函数恢复指定的Dispatch Queue";
}

/**
 例子1
 */
- (void)dispatchSuspendAndResume {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_suspend(queue);//挂起
    dispatch_resume(queue);//恢复

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
