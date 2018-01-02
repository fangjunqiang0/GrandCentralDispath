//
//  Ch12_ViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "Ch12_ViewController.h"
#import "Ch12Object.h"

@interface Ch12_ViewController ()

@end

@implementation Ch12_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     dispatch_once函数是保证在应用程序执行中中只执行一次指定处理的API。
     */
    
    Ch12Object *object1 = [Ch12Object ch12Object];
    Ch12Object *object2 = [Ch12Object ch12Object];
    
    if (object1 == object2) {
        NSLog(@"单例");
    }
    
    self.textView.text = @"dispatch_once函数是保证在应用程序执行中中只执行一次指定处理的API。";
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
