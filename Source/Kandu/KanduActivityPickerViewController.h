//
//  KanduActivityPickerViewController.h
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "KanduFindActivitiesViewController.h"

@interface KanduActivityPickerViewController : UIViewController <CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *activityPicker; //picker that the user picks activities from
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel; //label for user instruction
@property (nonatomic, retain) NSMutableArray *activityTypes; //activity types that the user picks from
@property (nonatomic, retain) CLLocation *userLocation; //the user's location
@property (nonatomic, retain) NSString *activityType; //activity type picked by the user

@end
