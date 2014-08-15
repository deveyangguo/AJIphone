//
//  AppDelegate.m
//  AJIphone
//
//  Created by 徐海军 on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "SoapNSXMLParserGroup.h"
#import "RTADataGroupViewController.h"
#import "RTARecordViewController.h"

@implementation AppDelegate

@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    //第一个Tab bar
    UINavigationController *navigationControllerTemp1 = [[tabBarController viewControllers] objectAtIndex:0];
    RTADataGroupViewController *groupViewControllerTemp = [[navigationControllerTemp1 viewControllers] objectAtIndex:0]; 
    //首页集团
    SoapNSXMLParserGroup *xmlPar = [[SoapNSXMLParserGroup alloc]init];
    xmlPar.delegate = groupViewControllerTemp;
    
    //第二个Tab bar
    UINavigationController *navigationControllerTemp2 = [[tabBarController viewControllers] objectAtIndex:1];
    navigationController = navigationControllerTemp2;
    
    //报警记录badge
    SoapNSXMLParserRecord *soap = [[SoapNSXMLParserRecord alloc]init];
    soap.delegate = self;
    //报警记录badge定时器
    myTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(myTaskMethodRecord) userInfo:nil repeats:YES];
    
    
    return YES;
}

-(void)myTaskMethodRecord
{ 
    @autoreleasepool {
        SoapNSXMLParserRecord *soap = [[SoapNSXMLParserRecord alloc]init];
        soap.delegate = self;
        soap = nil;
    }
}

-(void)GetData:(NSMutableArray *)recordArray
{
    myGlobeArray = recordArray;
    int count = [recordArray count];
    if (count > 0) {
        navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",[recordArray count]];
    }else {
        navigationController.tabBarItem.badgeValue = nil;
    }
    recordArray = nil;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [myTimer invalidate];
    myTimer = nil;
}

@end
