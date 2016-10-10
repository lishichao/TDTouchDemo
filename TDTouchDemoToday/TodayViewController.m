//
//  TodayViewController.m
//  TDTouchDemoToday
//
//  Created by 牛高航 on 2016/10/10.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

//在widget中，展开、折叠具体是实现
//初始化折叠状态
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}
//实现展开和折叠的逻辑处理
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    } else {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    设置展示视图的大小
    self.preferredContentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    
//    获取共享数据
    NSString*string=[self readDataFromNSUserDefaults];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-40, 30)];
    lab.backgroundColor=[UIColor redColor];
    lab.text=string;
    [self.view addSubview:lab];
    
    
//    设置点击范围
    UITapGestureRecognizer *tapG=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openURLContainingAPP)];
    [self.view addGestureRecognizer:tapG];
    
}
//调起app
//    因为extension和containing app是两个完全独立的进程，所以它们之间不能直接通信(不能像应用内部点击按钮，跳转到指定页面)。为了实现widget调起app，这里通过openURL的方式来启动containing app。
//打开主APP方法
- (void)openURLContainingAPP{
    //通过extensionContext借助host app调起app
    [self.extensionContext openURL:[NSURL URLWithString:@"appextension://"] completionHandler:^(BOOL success) {
        NSLog(@"open url result:%d",success);
    }];
}
//1 通过NSUserDefaults共享数据
// 通过App Groups提供的同一group内app共同读写区域，可以用NSUserDefaults和NSFileManager两种方式实现extension和containing app之间的数据共享。
//读取数据
- (NSString *)readDataFromNSUserDefaults{
    
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.MedSci"];
    NSString *value = [shared valueForKey:@"widget"];
    NSLog(@"插件获取共享数据==%@",value);
    return value;
    
}


//如果 3D Touch下并没有出现的添加widget的选项
//
//需要在主项目的plist中加入UIApplicationShortcutWidget，并把对应的widget bundle id 绑定即可




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
