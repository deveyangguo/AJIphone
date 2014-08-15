//
//  RTADataCompanyDetailViewController.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapNSXMLParserCompanyDetail.h"

@interface RTADataCompanyDetailViewController : UITableViewController<GetDataCompanyDetailDelegate>
{
   
    NSArray *records;
    
}

@property(nonatomic,strong) NSArray *records;

@end
