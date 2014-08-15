//
//  RTARecordViewController.m
//  AJIphone
//
//  Created by 徐海军 on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RTARecordViewController.h"
#import "RealTimeAlarmRecordInfo.h"

@interface RTARecordViewController ()

@end

@implementation RTARecordViewController

@synthesize records;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        //这是在测试
        //这是测试2
        //这是测试3
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    SoapNSXMLParserRecord *soap = [[SoapNSXMLParserRecord alloc]init];
//    soap.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //排序
    NSSortDescriptor* dx = [[NSSortDescriptor alloc] initWithKey:@"almType" ascending:NO];
    self.records = [myGlobeArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:dx]];
    
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointMake(0, 0)];
}


//-(void)GetData:(NSMutableArray *)recordArray
//{
//    //排序
//    NSSortDescriptor* dx = [[NSSortDescriptor alloc] initWithKey:@"almType" ascending:NO];
//    self.records = [recordArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:dx]];
//    
//    //self.records = recordArray;
//    recordArray = nil;
//    [self.tableView reloadData];    
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.records = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [records count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 5;
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   
{   
    if (indexPath.row == 3) {
        //不能用
        //UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        RealTimeAlarmRecordInfo *info = (RealTimeAlarmRecordInfo *)[records objectAtIndex:indexPath.section];
        //NSString *someString = [info.senInstallAddr stringByAppendingString:@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试"];
        
        UIFont *font = [UIFont systemFontOfSize:17.0];
        
        CGSize size = [info.senInstallAddr sizeWithFont:font constrainedToSize:CGSizeMake(204, 1000) lineBreakMode:UILineBreakModeWordWrap];  
        
        return size.height+15; // 10即消息上下的空间，可自由调整
    }
    
    return 36;
}  

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    static NSString *CellIdentifier1 = @"Cell1";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    static NSString *CellIdentifier2 = @"Cell2";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    static NSString *CellIdentifier3 = @"Cell3";
    UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier3];
    static NSString *CellIdentifier4 = @"Cell4";
    UITableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier4];
    
    static NSString *CellIdentifier5 = @"Cell5";
    UITableViewCell *cell5 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier5];
    
    //    cell.textLabel.textAlignment = UITextAlignmentLeft;
    //    cell.textLabel.textColor = [UIColor blackColor];
    //    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    
    RealTimeAlarmRecordInfo *info = (RealTimeAlarmRecordInfo *)[records objectAtIndex:indexPath.section];
    
    //实时｜历史 区别
    //UIDeviceRGBColorSpace 0.701961 0.701961 0.701961 1
    if ([info.almType isEqualToString:@"实时"]) {
        cell1.textLabel.textColor = [UIColor redColor];
    }else {
        cell1.textLabel.textColor = [UIColor colorWithRed:0.701961 green:0.701961 blue:0.701961 alpha:1];
    }
    
    
    if (indexPath.row == 0) {
        
        cell1.textLabel.text = [info.companyName stringByAppendingFormat:@"%@%@",@" — ",info.mineName];
        return cell1;
    }
    else if (indexPath.row == 1) {
        
        cell2.textLabel.text = @"测点";
        cell2.detailTextLabel.text = info.senID;
        return cell2; 
        
    }else if (indexPath.row == 2) {
        
        cell3.textLabel.text = @"类型";
        cell3.detailTextLabel.text = info.typeName;
        return cell3;
               
    }else if (indexPath.row == 3) {
        
        cell4.textLabel.text = @"安装地址";
        
        //自动增加行高
        cell4.detailTextLabel.numberOfLines = 0;
        cell4.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        
        //cell4.detailTextLabel.text = [info.senInstallAddr stringByAppendingString:@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试"];
        
        cell4.detailTextLabel.text = info.senInstallAddr;
        return cell4;
        
    }else if (indexPath.row == 4) {
        
        cell5.textLabel.text = @"开始时间";
        cell5.detailTextLabel.text = info.alarmStartTime;;
        return cell5;
        
    }    
        
    return cell1;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
