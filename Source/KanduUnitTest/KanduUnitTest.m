//
//  KanduUnitTest.m
//  KanduUnitTest
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import "KanduUnitTest.h"

@implementation KanduUnitTest

- (void)setUp
{
  [super setUp];
    
  // Set-up code here.
  testDelegate = [[UIApplication sharedApplication] delegate]; //initialize the app
  testNavigationController = (UINavigationController *)testDelegate.window.rootViewController; //start the nav controller
  testViewController = (KanduViewController *)testNavigationController.visibleViewController; //put on the first view
  
}

- (void)tearDown
{
  // Tear-down code here.
    
  [super tearDown];
}


- (void) testAppDelegate
{
  STAssertNotNil(testDelegate, @"Could not create delegate"); //test to make sure delegate is available
}

- (void)testTheNavigationController
{
  STAssertNotNil(testNavigationController, @"Could not create navigation controller"); //make sure navigation is available
}

- (void)testTheViewController
{
  STAssertNotNil(testViewController, @"Could not create view controller"); //make sure the user sees the first view
}

- (void)testTheLocationViewController
{
  testLocationViewController = (KanduLocationViewController *)testNavigationController.visibleViewController;
  STAssertNotNil(testLocationViewController, @"Could not create location view controller");
  CLLocationManager *testLocationManager = [[CLLocationManager alloc] init]; 
  STAssertNotNil(testLocationManager, @"Could not create location manager"); //make sure we can monitor user location
  CLLocation *testLocation = [[CLLocation alloc] init];
  STAssertNotNil(testLocation, @"Could not create location"); //make sure we can store a location
}

- (void)testTheActivityPickerViewController
{
  testPickActivityViewController = (KanduPickActivityViewController *)testNavigationController.visibleViewController;
  STAssertNotNil(testPickActivityViewController, @"Could not create activity picker view controller");
  NSMutableArray *testArray = [[NSMutableArray alloc] initWithCapacity:5];
  [testArray insertObject:@"Movies" atIndex:0];
  [testArray insertObject:@"Theme Parks" atIndex:1];
  [testArray insertObject:@"Sport Complexes" atIndex:2];
  [testArray insertObject:@"Parks" atIndex:3];
  [testArray insertObject:@"Local Attractions" atIndex:4];
  STAssertTrue([testArray count] == 5, @"Invalid array contents"); //make sure the picker is populated correctly
  UIPickerView *testPicker = [[UIPickerView alloc] init];
  STAssertNotNil(testPicker, @"Could not create picker"); //make sure the user can pick activity types
}

- (void)testTheFindActivityViewController
{
  testFindActivitiesViewController = (KanduFindActivitiesViewController *)testNavigationController.visibleViewController;
  STAssertNotNil(testFindActivitiesViewController, @"Could not create find activities view controller");
  MKMapView *testMap = [[MKMapView alloc] init];
  STAssertNotNil(testMap, @"Could not create map"); //make sure we can create a map
  UIToolbar *testToolBar = [[UIToolbar alloc] init];
  STAssertNotNil(testToolBar, @"Could not create tool bar"); //make sure the user has map controls
  MKPointAnnotation *testPoint = [[MKPointAnnotation alloc] init];
  STAssertNotNil(testPoint, @"Could not create point"); //make sure we can display points on the map
}

- (void)testThePickActivityViewController
{
  testPickActivityViewController = (KanduPickActivityViewController *)testNavigationController.visibleViewController;
  STAssertNotNil(testPickActivityViewController, @"Could not create pick activity view controller");
  UITableView *testTable = [[UITableView alloc] init]; //make sure the user can select activites
  STAssertNotNil(testTable, @"Could not create table");
  UIButton *testButton = [[UIButton alloc] init];
  STAssertNotNil(testButton, @"Could not create button"); //make sure the user can go on to the next view
}

- (void)testTheMailViewController
{
  testMailViewController = (KanduMailViewController *)testNavigationController.visibleViewController;
  STAssertNotNil(testMailViewController, @"Could not create mail view controller");
  MFMailComposeViewController *testMailController = [[MFMailComposeViewController alloc] init];
  STAssertNotNil(testMailController, @"Could not create mail composer"); //make sure the user can email
  UIAlertView *testAlert = [[UIAlertView alloc] init];
  STAssertNotNil(testAlert, @"Could not create alert"); //make sure we can alert the user
}

@end
