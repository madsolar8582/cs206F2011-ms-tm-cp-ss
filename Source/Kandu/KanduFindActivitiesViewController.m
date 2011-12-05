//
//  KanduFindActivitiesViewController.m
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "KanduFindActivitiesViewController.h"

@implementation KanduFindActivitiesViewController
@synthesize userLocationOld;
@synthesize activityType;
@synthesize activityMap;
@synthesize mapControlBar;
@synthesize activities;

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
  activityMap.showsUserLocation = YES;
  UIBarButtonItem *zoomButton = [[UIBarButtonItem alloc] initWithTitle:@"Zoom In" style:UIBarButtonItemStylePlain target:self action:@selector(zoomIn:)];
  UIBarButtonItem *typeButton = [[UIBarButtonItem alloc] initWithTitle:@"Type" style:UIBarButtonItemStylePlain target:self action:@selector(changeMapType:)];
  UIBarButtonItem *continueButton = [[UIBarButtonItem alloc] initWithTitle:@"Continue" style:UIBarButtonItemStylePlain target:self action:@selector(continueToNextView:)];
  
  NSArray *buttons = [[NSArray alloc] initWithObjects:zoomButton, typeButton, continueButton, nil];
  mapControlBar.items = buttons;
  activityMap.delegate = self;
  
  if (activityType == @"Movies") {
    CLLocationCoordinate2D rollaMovie;
    rollaMovie.latitude = 37.985;
    rollaMovie.longitude = -91.106;
    MKPointAnnotation *rollaMoviePoint = [[MKPointAnnotation alloc] init];
    rollaMoviePoint.coordinate = rollaMovie;
    rollaMoviePoint.title = @"Hollywood Forums Cinema";
    [activityMap addAnnotation:rollaMoviePoint];
    
    activities = [[NSArray alloc] initWithObjects:rollaMoviePoint.title, nil];
  } else if (activityType == @"Theme Parks") {
    CLLocationCoordinate2D themePark;
    themePark.latitude = 39.985;
    themePark.longitude = -91.106;
    MKPointAnnotation *themeParkPoint = [[MKPointAnnotation alloc] init];
    themeParkPoint.coordinate = themePark;
    themeParkPoint.title = @"Six Flags St. Louis";
    [activityMap addAnnotation:themeParkPoint];
    
    activities = [[NSArray alloc] initWithObjects:themeParkPoint.title, nil];
  }
  else if (activityType == @"Sport Complexes"){
    CLLocationCoordinate2D minerSports;
    minerSports.latitude = 37.985;
    minerSports.longitude = -91.106;
    MKPointAnnotation *minerSportsPoint = [[MKPointAnnotation alloc] init];
    minerSportsPoint.coordinate = minerSports;
    minerSportsPoint.title = @"Allgood-Bailey Stadium";
    minerSportsPoint.subtitle = @"Go Miners!";
    [activityMap addAnnotation:minerSportsPoint];
    
    CLLocationCoordinate2D scottTrade;
    scottTrade.latitude = 39.985;
    scottTrade.longitude = -91.106;
    MKPointAnnotation *scottTradePoint = [[MKPointAnnotation alloc] init];
    scottTradePoint.coordinate = scottTrade;
    scottTradePoint.title = @"Scott Trade Center";
    [activityMap addAnnotation:scottTradePoint];
    
    CLLocationCoordinate2D buschStadium;
    buschStadium.latitude = 39.642;
    buschStadium.longitude = -90.455;
    MKPointAnnotation *buschStadiumPoint = [[MKPointAnnotation alloc] init];
    buschStadiumPoint.coordinate = buschStadium;
    buschStadiumPoint.title = @"Busch Stadium";
    [activityMap addAnnotation:buschStadiumPoint];
    
    activities = [[NSArray alloc] initWithObjects:minerSportsPoint.title, scottTradePoint.title, 
                           buschStadiumPoint.title, nil];
  }
  else if (activityType == @"Parks"){
    CLLocationCoordinate2D schumanPark;
    schumanPark.latitude = 37.985;
    schumanPark.longitude = -91.106;
    MKPointAnnotation *schumanParkPoint = [[MKPointAnnotation alloc] init];
    schumanParkPoint.coordinate = schumanPark;
    schumanParkPoint.title = @"Schuman Park";
    [activityMap addAnnotation:schumanParkPoint];
    
    CLLocationCoordinate2D berJuan;
    berJuan.latitude = 35.102;
    berJuan.longitude = -90.032;
    MKPointAnnotation *berJuanPoint = [[MKPointAnnotation alloc] init];
    berJuanPoint.coordinate = berJuan;
    berJuanPoint.title = @"Ber Juan Park";
    [activityMap addAnnotation:berJuanPoint];
    
    CLLocationCoordinate2D lionClub;
    lionClub.latitude = 36.100;
    lionClub.longitude = -90.987;
    MKPointAnnotation *lionClubPoint = [[MKPointAnnotation alloc] init];
    lionClubPoint.coordinate = lionClub;
    lionClubPoint.title = @"Lions Club Park";
    [activityMap addAnnotation:lionClubPoint];
    
    CLLocationCoordinate2D markTwain;
    markTwain.latitude = 36.755;
    markTwain.longitude = -90.567;
    MKPointAnnotation *markTwainPoint = [[MKPointAnnotation alloc] init];
    markTwainPoint.coordinate = markTwain;
    markTwainPoint.title = @"Mark Twain National Forest";
    [activityMap addAnnotation:markTwainPoint];
    
    activities = [[NSArray alloc] initWithObjects:schumanParkPoint.title, berJuanPoint.title,
                           lionClubPoint.title, markTwainPoint.title, nil];
  }
  else {
    CLLocationCoordinate2D orvalReeves;
    orvalReeves.latitude = 37.985;
    orvalReeves.longitude = -91.106;
    MKPointAnnotation *orvalReevesPoint = [[MKPointAnnotation alloc] init];
    orvalReevesPoint.coordinate = orvalReeves;
    orvalReevesPoint.title = @"Orval Reeves Gallery";
    [activityMap addAnnotation:orvalReevesPoint];
    
    CLLocationCoordinate2D rUSGS;
    rUSGS.latitude = 35.102;
    rUSGS.longitude = -90.032;
    MKPointAnnotation *rUSGSPoint = [[MKPointAnnotation alloc] init];
    rUSGSPoint.coordinate = rUSGS;
    rUSGSPoint.title = @"Rolla US Geological Survey";
    [activityMap addAnnotation:rUSGSPoint];
    
    CLLocationCoordinate2D edClark;
    edClark.latitude = 36.100;
    edClark.longitude = -90.987;
    MKPointAnnotation *edClarkPoint = [[MKPointAnnotation alloc] init];
    edClarkPoint.coordinate = edClark;
    edClarkPoint.title = @"Edward L. Clark Museum";
    [activityMap addAnnotation:edClarkPoint];
    
    CLLocationCoordinate2D ozarkTheater;
    ozarkTheater.latitude = 36.755;
    ozarkTheater.longitude = -90.567;
    MKPointAnnotation *ozarkTheaterPoint = [[MKPointAnnotation alloc] init];
    ozarkTheaterPoint.coordinate = ozarkTheater;
    ozarkTheaterPoint.title = @"Ozark Actors Theatre";
    [activityMap addAnnotation:ozarkTheaterPoint];
    
    activities = [[NSArray alloc] initWithObjects:orvalReevesPoint.title, rUSGSPoint.title,
                           edClarkPoint.title, ozarkTheaterPoint.title, nil];
  }
}


- (void)viewDidUnload
{
  [self setActivityMap:nil];
  [self setMapControlBar:nil];
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
  if ([[segue identifier] isEqualToString:@"segueToPickActivity"]) {
    KanduPickActivityViewController *kpavc = (KanduPickActivityViewController *)[segue destinationViewController];
    [kpavc setLocatedActivities:activities];
  }
}

#pragma mark - Map Methods

-(void)zoomIn: (id)sender{
  MKUserLocation *mapUserLocation = activityMap.userLocation;
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mapUserLocation.location.coordinate, 50, 50);
  [activityMap setRegion:region animated:NO];
}

-(void)changeMapType: (id)sender{
  if (activityMap.mapType == MKMapTypeStandard) {
    activityMap.mapType = MKMapTypeSatellite;
  }
  else {
    activityMap.mapType = MKMapTypeStandard;
  }
}

-(void)continueToNextView: (id)sender{
  [self performSegueWithIdentifier:@"segueToPickActivity" sender:self];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
  self.activityMap.centerCoordinate = userLocation.location.coordinate;
}

@end
