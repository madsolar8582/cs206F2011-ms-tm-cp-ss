//
//  KanduUnitTest.h
//  KanduUnitTest
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#include "KanduAppDelegate.h"
#include "KanduViewController.h"
#include "KanduLocationViewController.h"
#include "KanduActivityPickerViewController.h"
#include "KanduFindActivitiesViewController.h"
#include "KanduPickActivityViewController.h"
#include "KanduMailViewController.h"

@interface KanduUnitTest : SenTestCase {

  KanduAppDelegate* testDelegate;
  UINavigationController* testNavigationController;
  KanduViewController* testViewController;
  KanduLocationViewController* testLocationViewController;
  KanduActivityPickerViewController* testActivityPickerViewController;
  KanduFindActivitiesViewController* testFindActivitiesViewController;
  KanduPickActivityViewController* testPickActivityViewController;
  KanduMailViewController* testMailViewController;

}

@end
