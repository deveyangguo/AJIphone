//
//  RealTimeDataViewController.m
//  AJIphone
//
//  Created by 徐海军 on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RTADataGroupViewController.h"
#import "SenTypeAlarmInfo.h"
#import "RTADataGroupDetailViewController.h"
#import "SoapNSXMLParserGroupDetail.h"
#import "RTADataCompanyViewController.h"
#import "SoapNSXMLParserCompany.h"


@interface RTADataGroupViewController ()

@end

@implementation RTADataGroupViewController

@synthesize records;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    //TabBar
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.4
                                                                        //alpha:1.0];
    //self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.4 alpha:1.0];

    //self.navigationController.navigationBar.alpha = 0.7;
    //self.tabBarController.tabBar.alpha = 0.7;
    
    //data    
    //[self getOffesetUTCTimeSOAP];
    
    
//    SoapNSXMLParser *xmlPar = [[SoapNSXMLParser alloc]init];
//    xmlPar.delegate = self;
    
    
    //定时器
    myTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(myTaskMethod) userInfo:nil repeats:YES];
    
}

-(void)myTaskMethod
{ 
    @autoreleasepool {
        SoapNSXMLParserGroup *xmlPar = [[SoapNSXMLParserGroup alloc]init];
        xmlPar.delegate = self;
        xmlPar = nil;
    }
}

-(void)GetData:(NSMutableArray *)recordArray
{
    records = recordArray;
    recordArray = nil;
    [self.tableView reloadData];
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
 - (void)loadView {
 }
 */

/*
 Implement viewDidLoad if you need to do additional setup after loading the view.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */



- (void)viewDidUnload
{   
    [super viewDidUnload];
    
    self.records = nil;
    [myTimer invalidate];
    myTimer = nil;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"Cell1";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];  
    
    static NSString *CellIdentifier2 = @"Cell2";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    
    static NSString *CellIdentifier3 = @"Cell3";
    UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier3];
    
    static NSString *CellIdentifier4 = @"Cell4";
    UITableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier4];
    
    //初始化
    //cell2
    cell2.tag = 0;
    cell2.detailTextLabel.text = @"0";
    cell2.detailTextLabel.textColor = [UIColor colorWithRed:0 green:0.25098 blue:0.501961 alpha:1];
    //cell2
    cell3.tag = 0;
    cell3.detailTextLabel.text = @"0";
    cell3.detailTextLabel.textColor = [UIColor colorWithRed:0 green:0.25098 blue:0.501961 alpha:1];
    //cell3
    cell4.tag = 0;
    cell4.detailTextLabel.text = @"0";
    cell4.detailTextLabel.textColor = [UIColor colorWithRed:0 green:0.25098 blue:0.501961 alpha:1];
    
    
    if (records.count > 0) {
        for (SenTypeAlarmInfo *info in records) {
            if ([info.senTypeName isEqualToString:@"瓦斯"]) {
                cell2.tag = [info.senTypeId integerValue];
                cell2.detailTextLabel.text = info.alarmNumber;
                cell2.detailTextLabel.textColor = [UIColor redColor];
            }
            else if([info.senTypeName isEqualToString:@"一氧化碳"])
            {
                cell3.tag = [info.senTypeId integerValue];
                cell3.detailTextLabel.text = info.alarmNumber;
                cell3.detailTextLabel.textColor = [UIColor redColor];

            }
            else if([info.senTypeName isEqualToString:@"主通风机"])
            {
                cell4.tag = [info.senTypeId intValue];
                cell4.detailTextLabel.text = info.alarmNumber;
                cell4.detailTextLabel.textColor = [UIColor redColor];
            }            
        }
    }
    
    if (indexPath.row == 0) {
        return cell1;
    }else if (indexPath.row == 1) {
        return cell2;
    }else if (indexPath.row == 2) {
        return cell3;
    }
    return cell4;
}

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Company"]) {
        RTADataCompanyViewController *company = segue.destinationViewController;
        
        SoapNSXMLParserCompany *soup = [[SoapNSXMLParserCompany alloc]init];
        soup.delegate = company;
               
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    if (indexPath.row > 0) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        //NSLog(@"%@,%@",cell.textLabel.text ,cell.detailTextLabel.text);
    
        RTADataGroupDetailViewController *groupDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"GroupDetail"];
        NSString *strTemp = [NSString stringWithFormat:@"%d",cell.tag];
        
        SoapNSXMLParserGroupDetail *soap = [[SoapNSXMLParserGroupDetail alloc]initWithSenTypeId:strTemp];
        soap.delegate = groupDetail;
        
        
        [self.navigationController pushViewController:groupDetail animated:YES];
    }
}


@end
