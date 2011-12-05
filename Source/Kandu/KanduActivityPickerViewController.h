//
//  KanduActivityPickerViewController.h
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "KanduFindActivitiesViewController.h"

@interface KanduActivityPickerViewController : UIViewController <CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *activityPicker;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;
@property (nonatomic, retain) NSMutableArray *activityTypes;
@property (nonatomic, retain) CLLocation *userLocation;
@property (nonatomic, retain) NSString *activityType;

@end
