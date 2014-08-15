//
//  Record.h
//  Hello_SOAP
//
//  Created by 徐海军 on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SenTypeAlarmInfo;


@interface CompanyAlarmInfo : NSObject
{
    NSString *companyName;
    NSMutableArray *senTypeAlarmInfoCollection;
}

@property(nonatomic,strong) NSString *companyName;
@property(nonatomic,strong) NSMutableArray *senTypeAlarmInfoCollection;

- (void)addType:(SenTypeAlarmInfo *)type;  

@end
