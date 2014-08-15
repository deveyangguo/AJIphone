//
//  RealTimeDataGSViewController.m
//  AJIphone
//
//  Created by 徐海军 on 12-7-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RTADataCompanyViewController.h"
#import "CompanyAlarmInfo.h"
#import "SenTypeAlarmInfo.h"
#import "RTADataCompanyDetailViewController.h"
#import "SoapNSXMLParserCompanyDetail.h"


@interface RTADataCompanyViewController ()

@end

@implementation RTADataCompanyViewController

@synthesize records;
@synthesize teamsname;
@synthesize typeArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    myTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(myTaskMethod) userInfo:nil repeats:YES];
    
    //self.teamsname = [[teams allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.teamsname = [NSArray arrayWithObjects:@"神东分公司",@"乌海能源",@"宁煤集团",@"神新分公司", nil];
    self.typeArray = [NSArray arrayWithObjects:@"瓦斯",@"一氧化碳",@"主通风机", nil];
}

-(void)myTaskMethod
{ 
    @autoreleasepool {
        SoapNSXMLParserCompany *xmlPar = [[SoapNSXMLParserCompany alloc]init];
        xmlPar.delegate = self; 
        xmlPar = nil;
    }
}

-(void)GetData:(NSMutableArray *)recordArray
{
    self.records = recordArray;
    recordArray = nil;
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.records = nil;
    self.teamsname = nil;
    self.typeArray = nil;
    
    [myTimer invalidate];
    myTimer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [teamsname count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [typeArray count];
}

- (NSString *)tableView:(UITableView *)tableView 
titleForHeaderInSection:(NSInteger)section {
	NSString *name = [teamsname objectAtIndex:section];
	return name;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *companyName = [teamsname objectAtIndex:indexPath.section];
    NSString *temp = [typeArray objectAtIndex:indexPath.row];
    
    //初始化
    cell.tag = 0;
    cell.textLabel.text = temp;
    cell.detailTextLabel.text = @"0";
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0 green:0.25098 blue:0.501961 alpha:1];
    
    for (CompanyAlarmInfo *info in records) {
        if ([info.companyName isEqualToString:companyName]) {
            for (SenTypeAlarmInfo *senInfo in info.senTypeAlarmInfoCollection) {
                if ([senInfo.senTypeName isEqualToString:temp]) {
                    cell.tag = [senInfo.senTypeId intValue];
                    cell.detailTextLabel.text = senInfo.alarmNumber;
                    cell.detailTextLabel.textColor = [UIColor redColor];                  
                }
            }
        }
    }

    return cell;
}

/*
 增加索引
 */
//-(NSArray *) sectionIndexTitlesForTableView: (UITableView *) tableView {
//	return teamsname;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CompanyDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *companyName = [teamsname objectAtIndex:indexPath.section];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        NSString *senTypeId = [NSString stringWithFormat:@"%d",cell.tag];
        
        RTADataCompanyDetailViewController *companyDetailViewController = segue.destinationViewController;
        
        SoapNSXMLParserCompanyDetail *soap = [[SoapNSXMLParserCompanyDetail alloc]initWithCompanyName:companyName andSenTypeId:senTypeId];
        soap.delegate = companyDetailViewController;        
    }
}

@end
