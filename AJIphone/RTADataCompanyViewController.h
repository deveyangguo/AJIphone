//
//  RealTimeDataGSViewController.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapNSXMLParserCompany.h"

@interface RTADataCompanyViewController : UITableViewController<GetDataCompanyDelegate>
{
	NSArray *records;
	NSArray *teamsname;
    NSArray *typeArray;
    
    NSTimer *myTimer;
}

@property (nonatomic,strong) NSArray *records;;
@property (nonatomic,strong) NSArray *teamsname;
@property (nonatomic,strong) NSArray *typeArray;


@end
