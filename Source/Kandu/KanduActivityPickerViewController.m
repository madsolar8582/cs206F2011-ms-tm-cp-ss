//
//  KanduActivityPickerViewController.m
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import "KanduActivityPickerViewController.h"

@implementation KanduActivityPickerViewController
@synthesize activityPicker;
@synthesize instructionLabel;
@synthesize activityTypes;
@synthesize userLocation;
@synthesize activityType;

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
  activityTypes = [[NSMutableArray alloc] initWithCapacity:5]; //populate the activity array with values
  [activityTypes insertObject:@"Movies" atIndex:0];
  [activityTypes insertObject:@"Theme Parks" atIndex:1];
  [activityTypes insertObject:@"Sport Complexes" atIndex:2];
  [activityTypes insertObject:@"Parks" atIndex:3];
  [activityTypes insertObject:@"Local Attractions" atIndex:4];
  instructionLabel.text = @"Choose and Activity Type: ";
}


- (void)viewDidUnload
{
  [self setActivityPicker:nil];
  [self setInstructionLabel:nil];
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
  if ([[segue identifier] isEqualToString:@"segueToFindActivity"]) {
    KanduFindActivitiesViewController *kfavc = (KanduFindActivitiesViewController *)[segue destinationViewController];
    [kfavc setUserLocationOld:userLocation]; //pass the user's location to the next view
    [kfavc setActivityType:activityType]; //pass the user's activity selection to the next view
  }
}

#pragma mark - Picker Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  return [activityTypes count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  return [activityTypes objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  activityType = [activityTypes objectAtIndex:[pickerView selectedRowInComponent:component]];
  [self performSegueWithIdentifier:@"segueToFindActivity" sender:self]; //when a type is picked, transition to next view
}

@end
