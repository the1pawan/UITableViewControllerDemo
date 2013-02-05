//
//  TableDataViewViewController.m
//  CompleteTable
//
//  Created by Shreekant Pawar on 04/02/13.
//  Copyright (c) 2013 the1pawan. All rights reserved.
//

#import "TableDataViewViewController.h"
#import "TableViewController.h"
@interface TableDataViewViewController ()

@end

@implementation TableDataViewViewController
@synthesize deleteData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    langArray=[[NSMutableArray alloc]init];
    [langArray addObject:@"C"];
    [langArray addObject:@"C++"];
    [langArray addObject:@"Obj-C"];
    [langArray addObject:@"Java"];
    [langArray addObject:@".NET"];
    [langArray addObject:@"Python"];
    [langArray addObject:@"Perl"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [langArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.textColor=[UIColor darkGrayColor];
    cell.textLabel.text = [langArray objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}



- (IBAction)DeleteDataAction:(id)sender {
    if(self.editing || [langArray count]==0)
    {
        
        [super setEditing:NO animated:NO];
        [dataTableView setEditing:NO animated:NO];
        [dataTableView reloadData];
        [self.deleteData setTitle:@"Delete"];
        
        
    }
    else
    {
        [super setEditing:YES animated:YES];
        [dataTableView setEditing:YES animated:YES];
        [dataTableView reloadData];
        [self.deleteData setTitle:@"Done"];
        
    }
}

// Add data to array to add it to table and reload data
- (IBAction)AddLanguage:(id)sender {
    NSLog(@"Add to aRray");
}



#pragma mark - UITableViewEditing


// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [langArray removeObjectAtIndex:indexPath.row];
    [self refreshTableView];
}

- (void)refreshTableView {
    //[langArray removeAllObjects];
    [dataTableView reloadData];
}

// on selected table cell do whatever you wan in this method
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [dataTableView deselectRowAtIndexPath:indexPath animated:YES];
    TableViewController *detailsofdoc=[[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
    [self presentViewController:detailsofdoc animated:YES completion:nil];
}

#pragma mark Row reordering
// Determine whether a given row is eligible for reordering or not.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// Process the row move. This means updating the data model to correct the item indices.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath
{
	NSString *item = [langArray objectAtIndex:fromIndexPath.row];
	[langArray removeObject:item];
	[langArray insertObject:item atIndex:toIndexPath.row];
}

@end
