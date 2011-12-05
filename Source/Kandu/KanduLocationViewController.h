//
//  KanduLocationViewController.h
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "KanduActivityPickerViewController.h"

@interface KanduLocationViewController : UIViewController <CLLocationManagerDelegate> 

@property (nonatomic, retain) CLLocationManager *locationManager; //manages location data
@property (nonatomic, retain) CLLocation *bestEffortAtLocation; //stored user location
@property (weak, nonatomic) IBOutlet UILabel *locationLabel; //displays user location

@end
