//
//  KanduPickActivityViewController.m
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
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
    NSLog(@"No activities passed, Error!");
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
    [kmvc setSelectedActivities:selActivities];
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
  //[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
  UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
  NSMutableArray *selectedItems = [[NSMutableArray alloc] initWithArray:locatedActivities];
  BOOL notIn = NO;
  
  if (cell.accessoryType == UITableViewCellAccessoryNone) {
    notIn = NO;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    for (int i = 0; i < [selectedItems count]; i++) {
      if ([selectedItems count] == 0) {
        [selectedItems addObject:cell.textLabel.text];
      }
      else if ([selectedItems objectAtIndex:i] == cell.textLabel.text) {
        notIn = YES;
      }
    }
    if (!notIn) {
      [selectedItems addObject:cell.textLabel.text];
    }
  }
  else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
    cell.accessoryType = UITableViewCellAccessoryNone;
    for (int i = 0; i < [selectedItems count]; i++) {
      if ([selectedItems objectAtIndex:i] == cell.textLabel.text) {
        [selectedItems removeObjectAtIndex:i];
      }
    }
  }
  
  selActivities = [[NSArray alloc] initWithArray:selectedItems];
}

@end
