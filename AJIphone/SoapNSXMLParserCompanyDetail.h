//
//  SoapNSXMLParserCompanyDetail.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RealTimeAlarmInfo;

@protocol GetDataCompanyDetailDelegate

-(void)GetData:(NSMutableArray *)records;

@end

@interface SoapNSXMLParserCompanyDetail : NSObject<NSXMLParserDelegate>

{   
    NSMutableData *webData;
	NSXMLParser *xmlParser;
    
	BOOL recordResults;
    
    NSMutableString *soapResults;
    NSMutableArray *records;
    
    RealTimeAlarmInfo *realTimeAlarmInfo;
    
    NSString *companyName;
    NSString *senTypeId;
}

@property(nonatomic,strong) NSMutableData *webData;

@property(nonatomic,strong) NSXMLParser *xmlParser;

@property(nonatomic,strong) NSMutableString *soapResults;
@property(nonatomic,strong) NSMutableArray *records;

@property(nonatomic,strong) RealTimeAlarmInfo *realTimeAlarmInfo;

@property(nonatomic,weak) id<GetDataCompanyDetailDelegate> delegate;

@property(nonatomic,strong) NSString *senTypeId;
@property(nonatomic,strong) NSString *companyName;

-(id)initWithCompanyName:(NSString *)strCompanyName andSenTypeId:(NSString *)strSenTypeId;

- (void)getOffesetUTCTimeSOAP;

@end
