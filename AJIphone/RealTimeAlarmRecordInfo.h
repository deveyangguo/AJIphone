//
//  RealTimeAlarmRecordInfo.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RealTimeAlarmRecordInfo : NSObject
{
    NSString *companyName;
    NSString *mineName;
    NSString *senID;
    NSString *typeName;
    NSString *senInstallAddr;
    NSString *alarmStartTime;
    NSString *almType;
}

@property(nonatomic,strong) NSString *companyName;
@property(nonatomic,strong) NSString *mineName;
@property(nonatomic,strong) NSString *senID;
@property(nonatomic,strong) NSString *typeName;
@property(nonatomic,strong) NSString *senInstallAddr;
@property(nonatomic,strong) NSString *alarmStartTime;
@property(nonatomic,strong) NSString *almType;
@end
