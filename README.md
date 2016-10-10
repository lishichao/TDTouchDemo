# TDTouchDemo
iOS开发之widget实现 .  iOS extension的出现，方便了用户查看应用的服务，比如用户可以在Today的widgets中查看应用的简略信息，然后点击进入相关的应用界面。

工作之余学习了一下3Dtouch开发，并且实现了widget插件开发。

# 主要功能实现
　1.静态标签 （ps：动态添加需要写代码，在AppDelegate.m文件中加，所以使用静态的挺好。 
             这是在网上找的，里面有详细的动态添加 http://www.cnblogs.com/zhanglinfeng/p/5133939.html ）
 
 打开我们项目的plist文件，添加如下项（选择框中并没有，需要我们手工敲上去）
  
![image](https://github.com/niugaohang/HealthModify/blob/master/HealthSportsDemo/HealthSport01.jpeg)

UIApplicationShortcutItems：数组中的元素就是我们的那些快捷选项标签。

UIApplicationShortcutItemTitle：标签标题（必填）

UIApplicationShortcutItemType：标签的唯一标识（必填）

UIApplicationShortcutItemIconType：使用系统图标的类型，如搜索、定位、home等（可选）

UIApplicationShortcutItemIconFile：使用项目中的图片作为标签图标（可选）

UIApplicationShortcutItemSubtitle：标签副标题（可选）

UIApplicationShortcutItemUserInfo：字典信息，如传值使用（可选）

//点击按钮跳转实现
#pragma mark -3Dtouch功能
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler{
    //判断先前我们设置的唯一标识
    NSLog(@"选择了3Dtouch功能--%@",shortcutItem.type);
    
//    页面跳转
    UIViewController *myVC;
    if ([shortcutItem.type isEqualToString:@"text"]) {
        myVC = [[UIViewController alloc]initWithNibName:@"YBSPublicViewController" bundle:nil];
    }
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:myVC];
    //设置当前的VC 为rootVC
    [self.window.rootViewController presentViewController:nav animated:YES completion:nil];
    
}

=========3dtouch功能就全部实现了=======================



