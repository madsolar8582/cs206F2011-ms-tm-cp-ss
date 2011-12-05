//
//  KanduMailViewController.h
//  Kandu
//
//  Created by Madison Solarana on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface KanduMailViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic, retain) NSArray *selectedActivities;

- (void)showMail:(id)sender;
- (void)displayMailSheet;
- (void)launchMailApp;

@end
