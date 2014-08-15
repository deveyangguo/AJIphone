//
//  SoapNSXMLParserCompanyDetail.m
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SoapNSXMLParserCompanyDetail.h"
#import "RealTimeAlarmInfo.h"

@implementation SoapNSXMLParserCompanyDetail

@synthesize webData,xmlParser;
@synthesize soapResults,records;
@synthesize realTimeAlarmInfo;
@synthesize delegate = _delegate;

@synthesize companyName,senTypeId;

-(id)initWithCompanyName:(NSString *)strCompanyName andSenTypeId:(NSString *)strSenTypeId;
{
    self = [super init];
    if (self) {
        companyName = strCompanyName;
        senTypeId = strSenTypeId;
        [self getOffesetUTCTimeSOAP];
    }
    return self;
}

- (void)getOffesetUTCTimeSOAP
{
    recordResults = NO;
    //NSLog(@"------%@---------",senTypeId);
	//封装soap请求消息
	NSString *soapMessage = [NSString stringWithFormat:
							 @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
							 "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
							 "<soap:Body>\n"
							 "<GetRealTimeAlarmInfo xmlns=\"http://thinkcore.net/webservices/\">\n"
                             "<companyName>%@</companyName>\n"
                             "<senTypeId>%@</senTypeId>\n"
							 "</GetRealTimeAlarmInfo>\n"
							 "</soap:Body>\n"
							 "</soap:Envelope>\n",companyName,senTypeId
							 ];
	//NSLog(@"%@",soapMessage);
	//请求发送到的路径
	NSURL *url = [NSURL URLWithString:@"http://10.200.193.251:7001/Services/KJNetDataInterface.asmx"];
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
	
	//以下对请求信息添加属性前四句是必有的，第五句是soap信息。
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: @"http://thinkcore.net/webservices/GetRealTimeAlarmInfo" forHTTPHeaderField:@"SOAPAction"];
	
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
	[theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
	
	//请求
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	
	//如果连接已经建好，则初始化data
	if( theConnection )
	{
		webData = [NSMutableData data];
	}
	else
	{
		//NSLog(@"theConnection is NULL");
	}
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength: 0];
	//NSLog(@"connection: didReceiveResponse:1");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
	//NSLog(@"connection: didReceiveData:2");
    
}

//如果电脑没有连接网络，则出现此信息（不是网络服务器不通）
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	//NSLog(@"ERROR with theConenction");
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //***********解决字符转义问题*************************
    //    NSString *result = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];
    //    NSString *tmp1 = [result stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    //    NSString *tmp2 = [tmp1 stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    //    
    //    NSData *xmlData = [tmp2 dataUsingEncoding:NSUTF8StringEncoding]; 
    //    webData = (NSMutableData*)xmlData;
    
    
//	NSLog(@"3 DONE. Received Bytes: %d", [webData length]);
//	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
//	NSLog(@"%@",theXML);
	
	//重新加載xmlParser
	if(xmlParser)
	{
		xmlParser = nil;
	}
	
	xmlParser = [[NSXMLParser alloc] initWithData: webData];
	[xmlParser setDelegate: self];
	[xmlParser setShouldResolveExternalEntities: YES];
	[xmlParser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
	//NSLog(@"4 parser didStarElemen: namespaceURI: attributes:");
    
    //		if( [elementName isEqualToString:@"CompanyName"])
    //	{
    //		if(!soapResults)
    //		{
    //			soapResults = [[NSMutableString alloc] init];
    //		}
    //		recordResults = YES;
    //	}
    
    if (self.realTimeAlarmInfo) { // Are we in a  
        // Check for standard nodes  
        if ([elementName isEqualToString:@"CompanyName"] || [elementName isEqualToString:@"MineName"] || [elementName isEqualToString:@"Value"] || [elementName isEqualToString:@"Unit"] || [elementName isEqualToString:@"SenID"] || [elementName isEqualToString:@"Duration"] || [elementName isEqualToString:@"SenInstallAddr"] || [elementName isEqualToString:@"StartTime"]) {  
            self.soapResults = [NSMutableString string];  
        }  
    } else { 
        // Check for deeper nested node  
        if ([elementName isEqualToString:@"RealTimeAlarmInfo"]) {  
            self.realTimeAlarmInfo = [[RealTimeAlarmInfo alloc] init];  
        }  
    }  
	
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	//NSLog(@"5 parser: foundCharacters:");
    
    //	if(recordResults)
    //	{
    //		[soapResults appendString: string];
    //	}
    
    if (self.soapResults) {  
        [soapResults appendString:string];  
    }  
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	//NSLog(@"6 parser: didEndElement:");
    
    //	if( [elementName isEqualToString:@"CompanyName"])
    //	{
    //		recordResults = FALSE;
    //		//greeting.text = [[[NSString init]stringWithFormat:@"第%@时区的时间是: ",nameInput.text] stringByAppendingString:soapResults];
    //        //greeting.text = soapResults;
    //        textView.text = soapResults;
    //        NSLog(@"%@",textView.text);
    //		[soapResults release];
    //		soapResults = nil;
    //		NSLog(@"hoursOffset result");
    //	}
    
    if (self.realTimeAlarmInfo) { // Are we in a  
        // Check for standard nodes  
        if ([elementName isEqualToString:@"CompanyName"]) {  
            self.realTimeAlarmInfo.companyName = self.soapResults;  
        } else if ([elementName isEqualToString:@"MineName"]) {  
            self.realTimeAlarmInfo.mineName = self.soapResults;  
        } else if ([elementName isEqualToString:@"Value"]) {  
            self.realTimeAlarmInfo.value = self.soapResults;  
        } else if ([elementName isEqualToString:@"Unit"]) {  
            self.realTimeAlarmInfo.unit = self.soapResults;  
        } else if ([elementName isEqualToString:@"SenID"]) {  
            self.realTimeAlarmInfo.senID = self.soapResults;  
        } else if ([elementName isEqualToString:@"Duration"]) {  
            self.realTimeAlarmInfo.duration = self.soapResults;  
        } else if ([elementName isEqualToString:@"SenInstallAddr"]) {  
            self.realTimeAlarmInfo.senInstallAddr = self.soapResults;  
        } else if ([elementName isEqualToString:@"StartTime"]) {  
            self.realTimeAlarmInfo.startTime = self.soapResults;  
            //end....
        } else if ([elementName isEqualToString:@"RealTimeAlarmInfo"]) {  
            [records addObject:self.realTimeAlarmInfo]; // Add to the result node  
            self.realTimeAlarmInfo = nil; // Set nil  
        }  
    } 
    // We reset the currentProperty, for the next textnodes..  
    self.soapResults = nil;  
    
}
- (void)parserDidStartDocument:(NSXMLParser *)parser{
	//NSLog(@"-------------------start--------------");
    records = [NSMutableArray array];
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
	//NSLog(@"-------------------end--------------");
//    NSLog(@"%@",[self.records description]);
//    for(RealTimeAlarmInfo *temp in records){
//        NSLog(@"%@,%@,%@",temp.companyName,temp.senInstallAddr,temp.senID);
//    }
    
    [self.delegate GetData:records];
    
}

@end

