//
//  KanduMailViewController.h
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface KanduMailViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) NSArray *selectedActivities; //user selected activites

- (void)showMail:(id)sender; //starts the process of composing an email
- (void)displayMailSheet; //displays the mail composition UI
- (void)launchMailApp; //launches the mail app on the iOS device

@end
