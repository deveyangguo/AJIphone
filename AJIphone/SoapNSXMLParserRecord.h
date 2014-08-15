//
//  SoapNSXMLParserRecord.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RealTimeAlarmRecordInfo;

@protocol GetDataRecordDelegate

-(void)GetData:(NSMutableArray *)records;

@end

@interface SoapNSXMLParserRecord : NSObject<NSXMLParserDelegate>

{   
    NSMutableData *webData;
	NSXMLParser *xmlParser;
    
	BOOL recordResults;
    
    NSMutableString *soapResults;
    NSMutableArray *records;
    
    RealTimeAlarmRecordInfo *realTimeAlarmRecordInfo;
}

@property(nonatomic,strong) NSMutableData *webData;

@property(nonatomic,strong) NSXMLParser *xmlParser;

@property(nonatomic,strong) NSMutableString *soapResults;
@property(nonatomic,strong) NSMutableArray *records;

@property(nonatomic,strong) RealTimeAlarmRecordInfo *realTimeAlarmRecordInfo;
@property(nonatomic,weak) id<GetDataRecordDelegate> delegate;


-(id)init;

- (void)getOffesetUTCTimeSOAP;

@end

