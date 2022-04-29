//
//  SceneDelegate.m
//  SampleAPP
//
//  Created by 王圣星 on 28/04/2022.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    NSLog(@"SceneDelegate#scene:(UIScene *)scene");
    if (scene) {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
            self.window = [[UIWindow alloc]initWithWindowScene:windowScene];
        UITabBarController *vc =[[UITabBarController alloc]init];
        
        UIViewController * viewController1 = [[UIViewController alloc] init];
        viewController1.view.backgroundColor = [UIColor whiteColor];
        viewController1.tabBarItem.title = @"新闻";
        
        UIViewController * viewController2 = [[UIViewController alloc] init];
        viewController2.view.backgroundColor = [UIColor grayColor];
        viewController2.tabBarItem.title = @"视频";
        
        UIViewController * viewController3 = [[UIViewController alloc] init];
        viewController3.view.backgroundColor = [UIColor greenColor];
        viewController3.tabBarItem.title = @"推荐";
        
        UIViewController * viewController4 = [[UIViewController alloc] init];
        viewController4.view.backgroundColor = [UIColor redColor];
        viewController4.tabBarItem.title = @"我的";
        
        [vc setViewControllers:@[viewController1,viewController2,viewController3,viewController4]];
        
//        vc.view.backgroundColor = [UIColor whiteColor];//如果不设置背景颜色，屏幕一会就会自动变黑，有知道原因的请赐教
        
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];
    }
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    NSLog(@"SceneDelegate#sceneDidDisconnect");
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    NSLog(@"SceneDelegate#sceneDidBecomeActive");
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    NSLog(@"SceneDelegate#sceneWillResignActive");
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    NSLog(@"SceneDelegate#sceneWillEnterForeground");
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    NSLog(@"SceneDelegate#sceneDidEnterBackground");
}


@end
