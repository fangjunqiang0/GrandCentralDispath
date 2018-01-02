//
//  Ch13_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch13_ViewController.h"

@interface Ch13_ViewController ()

@end

@implementation Ch13_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     Dispatch I/O和Dispatch Data 使用多线程并发的读取或写入大文件。
     如果想提高文件读取速度，可以尝试使用Dispatch I/O；
     */
    
    self.textView.text = @" Dispatch I/O和Dispatch Data 使用多线程并发的读取或写入大文件。\n如果想提高文件读取速度，可以尝试使用Dispatch I/O；";
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
