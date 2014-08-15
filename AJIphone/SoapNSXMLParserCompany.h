//
//  SoapNSXMLParser.h
//  AJIphone
//
//  Created by 徐海军 on 12-7-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SenTypeAlarmInfo;
@class CompanyAlarmInfo;

@protocol GetDataCompanyDelegate

-(void)GetData:(NSMutableArray *)records;

@end

@interface SoapNSXMLParserCompany:NSObject <NSXMLParserDelegate>
{   
    NSMutableData *webData;
	NSXMLParser *xmlParser;
    
	BOOL recordResults;
    
    NSMutableString *soapResults;
    NSMutableArray *records;
    
    SenTypeAlarmInfo *senTypeAlarmInfo;
    CompanyAlarmInfo *companyAlarmInfo;
    
}

@property(nonatomic,strong) NSMutableData *webData;

@property(nonatomic,strong) NSXMLParser *xmlParser;

@property(nonatomic,strong) NSMutableString *soapResults;
@property(nonatomic,strong) NSMutableArray *records;

@property(nonatomic,strong) SenTypeAlarmInfo *senTypeAlarmInfo;
@property(nonatomic,strong) CompanyAlarmInfo *companyAlarmInfo;

@property(nonatomic,weak) id<GetDataCompanyDelegate> delegate;


- (void)getOffesetUTCTimeSOAP;

@end
