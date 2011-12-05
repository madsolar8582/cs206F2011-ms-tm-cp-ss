//
//  KanduFindActivitiesViewController.h
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "KanduPickActivityViewController.h"

@interface KanduFindActivitiesViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (nonatomic, retain) CLLocation *userLocationOld;
@property (nonatomic, retain) NSString *activityType;
@property (weak, nonatomic) IBOutlet MKMapView *activityMap;
@property (weak, nonatomic) IBOutlet UIToolbar *mapControlBar;
@property (nonatomic, retain) NSArray *activities;


@end
