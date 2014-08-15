//
//  SoapNSXMLParserGroupDetail.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RealTimeAlarmInfo;

@protocol GetDataGroupDetailDelegate

-(void)GetData:(NSMutableArray *)records;

@end

@interface SoapNSXMLParserGroupDetail : NSObject<NSXMLParserDelegate>

{   
    NSMutableData *webData;
	NSXMLParser *xmlParser;
    
	BOOL recordResults;
    
    NSMutableString *soapResults;
    NSMutableArray *records;
    
    RealTimeAlarmInfo *realTimeAlarmInfo;
    
    NSString *senTypeId;
}

@property(nonatomic,strong) NSMutableData *webData;

@property(nonatomic,strong) NSXMLParser *xmlParser;

@property(nonatomic,strong) NSMutableString *soapResults;
@property(nonatomic,strong) NSMutableArray *records;

@property(nonatomic,strong) RealTimeAlarmInfo *realTimeAlarmInfo;

@property(nonatomic,weak) id<GetDataGroupDetailDelegate> delegate;

@property(nonatomic,strong) NSString *senTypeId;

-(id)initWithSenTypeId:(NSString *) strSenTypeId;

- (void)getOffesetUTCTimeSOAP;

@end

