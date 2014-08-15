//
//  RealTimeAlarmDataGroupDetailViewController.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapNSXMLParserGroupDetail.h"

@interface RTADataGroupDetailViewController : UITableViewController<GetDataGroupDetailDelegate>
{
    NSArray *records;
}

@property(nonatomic,strong) NSArray *records;
@end
