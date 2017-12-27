//
//  RootTableViewController.m
//  GrandCentralDispath
//
//  Created by fjq on 2017/12/23.
//  Copyright © 2017年 fjq. All rights reserved.
//

#import "RootTableViewController.h"
#import "BaseViewController.h"
#import "Ch1_ViewController.h"
#import "Ch2_ViewController.h"
#import "Ch3_ViewController.h"
#import "Ch4_ViewController.h"
#import "Ch5_ViewController.h"
#import "Ch6_ViewController.h"
#import "Ch7_ViewController.h"
#import "Ch8_ViewController.h"
#import "Ch9_ViewController.h"
#import "Ch10_ViewController.h"
#import "Ch11_ViewController.h"
#import "Ch12_ViewController.h"
#import "Ch13_ViewController.h"

@interface RootTableViewController ()
{
    NSArray *vcArray;
}

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"GCD API";
    
    vcArray = @[@"1.Dispath Queue",
                @"2.dispath_queue_create",
                @"3.Main Dispath Queue",
                @"4.dispath_set_target_queue",
                @"5.dispath_after",
                @"6.Dispath Group",
                @"7.dispath_barrier_async",
                @"8.dispatch_sync",
                @"9.dispatch_apply",
                @"10.dispath_suspend",
                @"11.dispath_semaphore",
                @"12.dispath_once",
                @"13.Dispath I/O"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return vcArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = vcArray[indexPath.row];
    
    return cell;
}


#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseViewController *bvc;
    
    switch (indexPath.row) {
        case 0:
            bvc = [(BaseViewController *)[Ch1_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 1:
            bvc = [(BaseViewController *)[Ch2_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 2:
            bvc = [(BaseViewController *)[Ch3_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 3:
            bvc = [(BaseViewController *)[Ch4_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 4:
            bvc = [(BaseViewController *)[Ch5_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 5:
            bvc = [(BaseViewController *)[Ch6_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 6:
            bvc = [(BaseViewController *)[Ch7_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 7:
            bvc = [(BaseViewController *)[Ch8_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 8:
            bvc = [(BaseViewController *)[Ch9_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 9:
            bvc = [(BaseViewController *)[Ch10_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 10:
            bvc = [(BaseViewController *)[Ch11_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 11:
            bvc = [(BaseViewController *)[Ch12_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        case 12:
            bvc = [(BaseViewController *)[Ch13_ViewController alloc]initWithNibName:@"BaseViewController" bundle:nil];
            break;
        default:
            break;
    }
    
    bvc.navTitle = vcArray[indexPath.row];
    [self.navigationController pushViewController:bvc animated:YES];
}

@end
