//
//  KanduPickActivityViewController.m
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import "KanduPickActivityViewController.h"

@implementation KanduPickActivityViewController
@synthesize locatedActivities;
@synthesize locationTable;
@synthesize emailButton;
@synthesize selActivities;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  if ([locatedActivities count] == 0) {
    NSLog(@"No activities passed"); //log to let us know the user didn't select anything
  }
}


- (void)viewDidUnload
{
  [self setLocationTable:nil];
  [self setEmailButton:nil];
  [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([[segue identifier] isEqualToString:@"segueToMail"]) {
    KanduMailViewController *kmvc = (KanduMailViewController *)[segue destinationViewController];
    [kmvc setSelectedActivities:selActivities]; //transfer the selected activites to the mail view
  }
}

#pragma mark - Table Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [locatedActivities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  
  cell.textLabel.text = [locatedActivities objectAtIndex:indexPath.row];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
  UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
  NSMutableArray *selectedItems = [[NSMutableArray alloc] initWithArray:locatedActivities]; //tracks selected activities
  BOOL notIn = NO;
  
  //This loop determines if an activity is already being tracked and adds/removes it accordingly
  if (cell.accessoryType == UITableViewCellAccessoryNone) {
    notIn = NO;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    for (int i = 0; i < [selectedItems count]; i++) {
      if ([selectedItems count] == 0) {
        [selectedItems addObject:cell.textLabel.text]; //add by default if empty
      }
      else if ([selectedItems objectAtIndex:i] == cell.textLabel.text) {
        notIn = YES;
      }
    }
    if (!notIn) {
      [selectedItems addObject:cell.textLabel.text]; //add because not found and user selected
    }
  }
  else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
    cell.accessoryType = UITableViewCellAccessoryNone;
    for (int i = 0; i < [selectedItems count]; i++) {
      if ([selectedItems objectAtIndex:i] == cell.textLabel.text) {
        [selectedItems removeObjectAtIndex:i]; //remove since user unselected
      }
    }
  }
  
  selActivities = [[NSArray alloc] initWithArray:selectedItems]; //update the contents being tracked
}

@end
