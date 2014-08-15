//
//  RealTimeAlarmInfo.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RealTimeAlarmInfo : NSObject
{
    NSString *companyName;
    NSString *mineName;
    NSString *value;
    NSString *unit;
    NSString *senID;
    NSString *duration;
    NSString *senInstallAddr;
    NSString *startTime;
    
}
@property(nonatomic,strong) NSString *companyName;
@property(nonatomic,strong) NSString *mineName;
@property(nonatomic,strong) NSString *value;
@property(nonatomic,strong) NSString *unit;
@property(nonatomic,strong) NSString *senID;
@property(nonatomic,strong) NSString *duration;
@property(nonatomic,strong) NSString *senInstallAddr;
@property(nonatomic,strong) NSString *startTime;

@end
