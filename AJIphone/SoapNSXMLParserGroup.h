//
//  SoapNSXMLParserGroup.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SenTypeAlarmInfo;

@protocol GetDataGroupDelegate

-(void)GetData:(NSMutableArray *)records;

@end

@interface SoapNSXMLParserGroup : NSObject<NSXMLParserDelegate>
{   
    NSMutableData *webData;
	NSXMLParser *xmlParser;
    
	BOOL recordResults;
    
    NSMutableString *soapResults;
    NSMutableArray *records;
    
    SenTypeAlarmInfo *senTypeAlarmInfo;
    
}

@property(nonatomic,strong) NSMutableData *webData;

@property(nonatomic,strong) NSXMLParser *xmlParser;

@property(nonatomic,strong) NSMutableString *soapResults;
@property(nonatomic,strong) NSMutableArray *records;

@property(nonatomic,strong) SenTypeAlarmInfo *senTypeAlarmInfo;

@property(nonatomic,weak) id<GetDataGroupDelegate> delegate;


- (void)getOffesetUTCTimeSOAP;

@end

