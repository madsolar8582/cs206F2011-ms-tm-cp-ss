//
//  KanduMailViewController.m
//  Kandu
//
//  Created by Madison Solarana on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "KanduMailViewController.h"

@implementation KanduMailViewController
@synthesize selectedActivities;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
  if ([selectedActivities count] == 0) {
    NSLog(@"No activities passed");
  }
  [self showMail:self];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Mail Methods

- (void)showMail:(id)sender{
  Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
  
  if (mailClass != nil) {
    if ([mailClass canSendMail]) {
      [self displayMailSheet];
    }
    else {
      [self launchMailApp];
    }
  }
  else {
    [self launchMailApp];
  }
}

- (void)displayMailSheet{
  MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
  mailController.mailComposeDelegate = self;
  NSString *tempString;
  
  [mailController setSubject:@"The Itinerary"];
  
  NSArray *toRecipients = [NSArray arrayWithObject:@"person@example.com"];
  [mailController setToRecipients:toRecipients];
  
  NSString *emailBody = @"Here are the places we are going to go to: \n";
  for (int i = 0; i < [selectedActivities count]; i++) {
    tempString = [emailBody stringByAppendingString:[selectedActivities objectAtIndex:i]];
    emailBody = [tempString stringByAppendingString:@"\n"];
  }
  
  [mailController setMessageBody:emailBody isHTML:NO];
  
  [self presentModalViewController:mailController animated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
  NSString *errorMessage;
  
  switch (result) {
    case MFMailComposeResultSent: {
      errorMessage = @"Message Sent!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show];
      break;
    }
    case MFMailComposeResultCancelled: {
      errorMessage = @"Message Cancelled!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show];
      break;
    }
    case MFMailComposeResultFailed: {
      errorMessage = @"Unable to send message!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show];
      break;
    }
    case MFMailComposeResultSaved: {
      errorMessage = @"Message Saved!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show];
      break;
    }
      
    default: {
      errorMessage = @"Unknown Error!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show];
    }
    break;
  }
  
  [self dismissModalViewControllerAnimated:YES];
}

- (void) launchMailApp{
  NSString *recipients = @"mailto:person@example.com&subject=The Itinerary";
  NSString *body = @"";
  NSString *email = [NSString stringWithFormat:@"%@%@",recipients,body];
  
  email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

@end
