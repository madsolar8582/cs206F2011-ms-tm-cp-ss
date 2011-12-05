//
//  KanduFindActivitiesViewController.h
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "KanduPickActivityViewController.h"

@interface KanduFindActivitiesViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, retain) CLLocation *userLocationOld; //user's location reference
@property (nonatomic, retain) NSString *activityType; //user's selected activity
@property (weak, nonatomic) IBOutlet MKMapView *activityMap; //map that displays locations
@property (weak, nonatomic) IBOutlet UIToolbar *mapControlBar; //toolbar that provides map controls
@property (nonatomic, retain) NSArray *activities; //contains available activites that match the user's selection


@end
