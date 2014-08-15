//
//  Type.h
//  Hello_SOAP
//
//  Created by 徐海军 on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SenTypeAlarmInfo : NSObject
{
    NSString *senTypeId;
    NSString *senTypeName;
    NSString *alarmNumber;
}

@property (nonatomic,strong) NSString *senTypeId;
@property (nonatomic,strong) NSString *senTypeName;
@property (nonatomic,strong) NSString *alarmNumber;

@end
