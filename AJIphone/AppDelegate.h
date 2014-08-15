//
//  AppDelegate.h
//  AJIphone
//
//  Created by 徐海军 on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapNSXMLParserRecord.h"

NSArray *myGlobeArray;

@interface AppDelegate : UIResponder <UIApplicationDelegate,GetDataRecordDelegate>
{
    UINavigationController *navigationController;
    NSTimer *myTimer;
}

@property (nonatomic,strong) UIWindow *window;

@end
