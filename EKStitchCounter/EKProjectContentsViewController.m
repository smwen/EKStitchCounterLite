//
//  EKProjectContentsViewController.m
//  EKStitchCounter
//
//  Created by Sandy Wen on 4/7/13.
//  Copyright (c) 2013 Sandy Wen. All rights reserved.
//

#import "EKProjectContentsViewController.h"
#import "EKStitchCounterTableViewCell.h"
#import "EKStitchCounter.h"
#import "EKStitchCounterEditController.h"

@interface EKProjectContentsViewController ()
//@property NSMutableArray *stitchCounters;
@end

@implementation EKProjectContentsViewController{
    NSMutableArray *stitchCounters;
}

//@synthesize stitchCounters;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

/*
    // initialize counters for testing
    EKStitchCounter * stitchCounter1 = [[EKStitchCounter alloc] init];
    stitchCounter1.title = @"Sleeve Rows";
    stitchCounter1.count = 5;
    
    EKStitchCounter * stitchCounter2 = [[EKStitchCounter alloc] init];
    stitchCounter2.title = @"Left Side M1";
    stitchCounter2.count = 2;
    
    stitchCounters = [NSMutableArray arrayWithObjects: stitchCounter1, stitchCounter2, nil];
*/
    stitchCounters = [[NSMutableArray alloc] init];
/*
    //background and formatting
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIEdgeInsets inset = UIEdgeInsetsMake(2, 0, 0, 0);
    self.tableView.contentInset = inset;
*/
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
//    return 1;
    return stitchCounters.count; // new implementation with groups
}

-(NSIndexPath *)getCurrentSectionForUIButton:(UIButton *)sender {
    NSIndexPath *pathToCell;
    
    //Get the superview from this button which will be our cell
	UITableViewCell *owningCell = (UITableViewCell*)sender.superview.superview;
	//From the cell get its index path.
    if (owningCell != nil){
        pathToCell = [self.tableView indexPathForCell:owningCell];
    } else {
        pathToCell = nil;
    }
    return pathToCell;
    
}

/*
- (IBAction)addNewCounter:(UIBarButtonItem *)sender {
    NSString *newTitle = [NSString stringWithFormat:@"Counter %d",self.tableView.numberOfSections + 1];
    EKStitchCounter *newCounter = [[EKStitchCounter alloc] initWithTitle:newTitle];
    [stitchCounters addObject:(id)newCounter];
    [self.tableView reloadData];
}
*/

- (IBAction)addNewCounter:(UIBarButtonItem *)sender {
    EKStitchCounter *newCounter = [[EKStitchCounter alloc] init];
    [stitchCounters addObject:newCounter];
    newCounter.title = [[NSString alloc] initWithFormat:@"Counter %d",self.tableView.numberOfSections + 1];
    NSArray *insertIndexPaths = [NSArray arrayWithObjects:
                                 [NSIndexPath indexPathForRow:0 inSection:self.tableView.numberOfSections],
                                 nil];
    
    UITableView *tv = self.tableView;
    [tv beginUpdates];
    [tv insertSections:[NSIndexSet indexSetWithIndex:self.tableView.numberOfSections] withRowAnimation:UITableViewRowAnimationRight];
    [tv insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationNone];
    [tv endUpdates];
}

- (IBAction)decrementCounter:(UIButton *)sender {
    NSIndexPath * currSecPath = [self getCurrentSectionForUIButton:sender];
    if (currSecPath) {
        [(EKStitchCounter *)stitchCounters[currSecPath.section] decrementCounter];
        int newCount = ((EKStitchCounter *)stitchCounters[currSecPath.section]).count;
//        UILabel *stitchCountLabel = (UILabel *)[[self.tableView cellForRowAtIndexPath:currRowPath] viewWithTag:103];
        UILabel *stitchCountLabel = ((EKStitchCounterTableViewCell *)[self.tableView cellForRowAtIndexPath:currSecPath]).counterNumLabel;
        stitchCountLabel.text = [NSString stringWithFormat:@"%d", newCount];
    }
    
}

- (IBAction)incrementCounter:(UIButton *)sender {
    NSIndexPath * currSecPath = [self getCurrentSectionForUIButton:sender];
    if (currSecPath) {
        [(EKStitchCounter *)stitchCounters[currSecPath.section] incrementCounter];
        int newCount = ((EKStitchCounter *)stitchCounters[currSecPath.section]).count;
        UILabel *stitchCountLabel = ((EKStitchCounterTableViewCell *)[self.tableView cellForRowAtIndexPath:currSecPath]).counterNumLabel;
        stitchCountLabel.text = [NSString stringWithFormat:@"%d", newCount];
    }
        
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editCounterView"]) {
        
        // Get destination view
        EKStitchCounterEditController * vc = [segue destinationViewController];
        
        // Get button tag number (or do whatever you need to do here, based on your object
        NSIndexPath * currSecPath = [self getCurrentSectionForUIButton:sender];
        vc.tableSectionNumber = currSecPath.section;
        vc.currentStitchCounter = (EKStitchCounter *)stitchCounters[currSecPath.section];
        
        // Pass the information to your destination view
    }
}
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//    return stitchCounters.count;
    return 1;
}

// uses UITableViewCell subclass
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StitchCounterCell";
    EKStitchCounterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = (EKStitchCounterTableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    // Display counter in the table cell
    EKStitchCounter * stitchCounter = [stitchCounters objectAtIndex:indexPath.section];
    cell.counterTitleLabel.text = stitchCounter.title;
    cell.counterNumLabel.text =[NSString stringWithFormat:@"%d", stitchCounter.count];
    
    return cell;
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

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
