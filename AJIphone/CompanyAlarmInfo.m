//
//  Record.m
//  Hello_SOAP
//
//  Created by 徐海军 on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CompanyAlarmInfo.h"
#import "SenTypeAlarmInfo.h"

@implementation CompanyAlarmInfo

@synthesize companyName,senTypeAlarmInfoCollection;

- (void)addType:(SenTypeAlarmInfo *)type
{
    if (senTypeAlarmInfoCollection == nil) {
        senTypeAlarmInfoCollection = [NSMutableArray array];
    }
    [senTypeAlarmInfoCollection addObject:type];
}


@end
