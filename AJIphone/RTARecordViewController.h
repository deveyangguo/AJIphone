//
//  RTARecordViewController.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SoapNSXMLParserRecord.h"

extern NSArray *myGlobeArray;

@interface RTARecordViewController : UITableViewController
{   
    NSArray *records;    
}

@property(nonatomic,strong) NSArray *records;

@end
