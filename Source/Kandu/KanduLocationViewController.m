//
//  KanduLocationViewController.m
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "KanduLocationViewController.h"

@implementation KanduLocationViewController
@synthesize locationManager;
@synthesize bestEffortAtLocation;
@synthesize locationLabel;

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
  if (nil == locationManager) {
    locationManager = [[CLLocationManager alloc] init];
  }
  
  locationManager.delegate = self;
  [locationManager startMonitoringSignificantLocationChanges];
}


- (void)viewDidUnload
{
  [self setLocationLabel:nil];
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
  if ([[segue identifier] isEqualToString:@"segueToActivity"]) {
    KanduActivityPickerViewController *kapvc = (KanduActivityPickerViewController *)[segue destinationViewController];
    [kapvc setUserLocation:bestEffortAtLocation];
  }
}

#pragma mark - Location Methods


-(void)locationManager:(CLLocationManager *) manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
  
  NSDate* eventDate = newLocation.timestamp;
  NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
  if (abs(howRecent < 15.0)) {
    float lat = newLocation.coordinate.latitude;
    float lon = newLocation.coordinate.longitude;
    locationLabel.text = [NSString stringWithFormat:@"Latitude: %f Longitude: %f",lat,lon];
    bestEffortAtLocation = newLocation;
  }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
  NSLog(@"Error %@",[error description]);
}

@end
