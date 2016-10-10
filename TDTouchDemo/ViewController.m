//
//  ViewController.m
//  TDTouchDemo
//
//  Created by 牛高航 on 2016/10/10.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self saveDataByNSUserDefaults];
}

//保存数据
- (void)saveDataByNSUserDefaults
{
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.MedSci"];
    [shared setObject:@"这是一条资讯" forKey:@"widget"];
    [shared synchronize];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
