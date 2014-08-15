//
//  RealTimeDataViewController.h
//  AJIphone
//
//  Created by 徐海军 on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapNSXMLParserGroup.h"
@class RTADataCompanyViewController;

@interface RTADataGroupViewController : UITableViewController<GetDataGroupDelegate>
{   
    NSArray *records;  
    NSTimer *myTimer;
}

@property(nonatomic,strong) NSArray *records;

@end
