//
//  AppDelegate.m
//  SampleAPP
//
//  Created by 王圣星 on 28/04/2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *vc =[[UITabBarController alloc]init];
    
    UIViewController * viewController1 = [[UIViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor whiteColor];
    viewController1.tabBarItem.title = @"新闻";
    
    UIViewController * viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor whiteColor];
    viewController2.tabBarItem.title = @"视频";
    
    UIViewController * viewController3 = [[UIViewController alloc] init];
    viewController3.view.backgroundColor = [UIColor whiteColor];
    viewController3.tabBarItem.title = @"推荐";
    
    UIViewController * viewController4 = [[UIViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor whiteColor];
    viewController4.tabBarItem.title = @"我的";
    
    [vc setViewControllers:@[viewController1,viewController2,viewController3,viewController4]];
    
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//    NSLog(@")application:(UIApplication *)application didFinishLaunchingWithOptions:");
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
