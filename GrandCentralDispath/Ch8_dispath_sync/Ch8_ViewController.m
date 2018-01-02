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
     dispatch_sync()函数意味着“同步”（asynchronous）
     */
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
