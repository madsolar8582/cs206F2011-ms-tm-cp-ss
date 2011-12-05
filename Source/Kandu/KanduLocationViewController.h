//
//  KanduLocationViewController.h
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "KanduActivityPickerViewController.h"

@interface KanduLocationViewController : UIViewController <CLLocationManagerDelegate> 

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *bestEffortAtLocation;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
