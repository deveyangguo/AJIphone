//
//  RealTimeAlarmDataGroupDetailViewController.m
//  AJIphone
//
//  Created by 徐海军 on 12-7-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RTADataGroupDetailViewController.h"
#import "RealTimeAlarmInfo.h"


@interface RTADataGroupDetailViewController ()

@end

@implementation RTADataGroupDetailViewController

@synthesize records;

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
    self.title = @"实时报警数据";
}

-(void)GetData:(NSMutableArray *)recordArray
{
    records = recordArray;
    recordArray = nil;
    [self.tableView reloadData];
}

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

    return [records count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   
{   
    if (indexPath.row == 4) {
        //不能用
        //UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        RealTimeAlarmInfo *info = (RealTimeAlarmInfo *)[records objectAtIndex:indexPath.section];
        //NSString *someString = [info.senInstallAddr stringByAppendingString:@"测试"];
        
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
    
    static NSString *CellIdentifier6 = @"Cell6";
    UITableViewCell *cell6 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier6];
    
    //    cell.textLabel.textAlignment = UITextAlignmentLeft;
    //    cell.textLabel.textColor = [UIColor blackColor];
    //    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    
    RealTimeAlarmInfo *info = (RealTimeAlarmInfo *)[records objectAtIndex:indexPath.section];
    if (indexPath.row == 0) {
        
        cell1.textLabel.text = [info.companyName stringByAppendingFormat:@"%@%@",@" — ",info.mineName];
        return cell1;
    }
    else if (indexPath.row == 1) {
        
        cell2.textLabel.text =  [info.value stringByAppendingFormat:@"%@%@",@" ",info.unit];
        return cell2;
        
    }else if (indexPath.row == 2) {
        
        cell3.textLabel.text = @"测点";
        cell3.detailTextLabel.text = info.senID;
        return cell3;        
    }else if (indexPath.row == 3) {
        
        cell4.textLabel.text = @"持续时长";
        cell4.detailTextLabel.text = info.duration;
        return cell4;
        
    }else if (indexPath.row == 4) {
        
        cell5.textLabel.text = @"安装地址";
        //自动增加行高
        cell5.detailTextLabel.numberOfLines = 0;
        cell5.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        //cell5.detailTextLabel.text = [info.senInstallAddr stringByAppendingString:@"测试"];
        cell5.detailTextLabel.text = info.senInstallAddr;
        return cell5;
        
    }else if (indexPath.row == 5) {
        
        cell6.textLabel.text = @"开始时间";
        cell6.detailTextLabel.text = info.startTime;
        return cell6;
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
