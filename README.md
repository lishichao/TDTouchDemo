# TDTouchDemo
iOS开发之widget实现 .  iOS extension的出现，方便了用户查看应用的服务，比如用户可以在Today的widgets中查看应用的简略信息，然后点击进入相关的应用界面。

工作之余学习了一下3Dtouch开发，并且实现了widget插件开发。

# 主要3Dtouch功能实现
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
pragma mark -3Dtouch功能
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

# 主要widget插件开发功能实现  
（ps:关于widget插件开发  我觉得这位仁兄写的比较详细 http://www.hmttommy.com/2014/11/02/widget/ ）

1.创建Widget

Xcode菜单 -> File -> New -> Target.. -> 选择Today Extension

2.在plist文件里设置纯代码的Widget

删掉NSExtensionMainStoryboard字段
添加NSExtensionPrincipalClass字段,设置value为TodayViewController,当然也可以设置其他的ViewController

![image](https://github.com/niugaohang/HealthModify/blob/master/HealthSportsDemo/HealthSport01.jpeg)

3.设置Extension和Containing App、host app之间的关系、Containing App与扩展共享数据、开启App Groups等等知识点 就可以自己个Google了 网上的资料中写得很详细！

4.在插件中打开主 app.调用下面方法:
- (void)openURL:(NSURL *)URL completionHandler:(void (^)(BOOL success))completionHandler;

需要设置 
![image](https://github.com/niugaohang/HealthModify/blob/master/HealthSportsDemo/HealthSport01.jpeg)

其他的需要设置的在demo只有注释。

# 来一波运行效果图

![image](https://github.com/niugaohang/HealthModify/blob/master/HealthSportsDemo/HealthSport01.jpeg)

![image](https://github.com/niugaohang/HealthModify/blob/master/HealthSportsDemo/HealthSport01.jpeg)

![image](https://github.com/niugaohang/HealthModify/blob/master/HealthSportsDemo/HealthSport01.jpeg)



