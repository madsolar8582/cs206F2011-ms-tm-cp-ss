//
//  KanduMailViewController.m
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
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
    NSLog(@"No activities passed"); //log to let us know the user didn't select anything
  }
  [self showMail:self]; //begin email UI methods
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
  
  //Here we check to see what email options the iOS device supports
  if (mailClass != nil) {
    if ([mailClass canSendMail]) {
      [self displayMailSheet]; //display the mail composition UI
    }
    else {
      [self launchMailApp]; //launch the iOS device's mail app
    }
  }
  else {
    [self launchMailApp]; //launch the iOS device's mail app
  }
}

- (void)displayMailSheet{
  MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
  mailController.mailComposeDelegate = self; //tell mail controller to report to itself in this view
  NSString *tempString; //used to create the email body contents as a temporary text holder
  
  [mailController setSubject:@"The Itinerary"]; //set the subject of the email
  
  NSArray *toRecipients = [NSArray arrayWithObject:@"person@example.com"]; //define default recipients
  [mailController setToRecipients:toRecipients]; //add recipients
  
  NSString *emailBody = @"Here are the places we are going to go to: \n";
  
  //This loop goes through the activities array and adds them to the body text
  for (int i = 0; i < [selectedActivities count]; i++) {
    tempString = [emailBody stringByAppendingString:[selectedActivities objectAtIndex:i]];
    emailBody = [tempString stringByAppendingString:@"\n"];
  }
  
  [mailController setMessageBody:emailBody isHTML:NO]; //send plain text email
  
  [self presentModalViewController:mailController animated:YES]; //show message composition
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
  NSString *errorMessage;
  
  //Determine what the result was of the email composition and alert the user
  switch (result) {
    case MFMailComposeResultSent: {
      errorMessage = @"Message Sent!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show]; //show that the message was sent successfully
      break;
    }
    case MFMailComposeResultCancelled: {
      errorMessage = @"Message Cancelled!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show]; //show that the message was cancelled
      break;
    }
    case MFMailComposeResultFailed: {
      errorMessage = @"Unable to send message!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show]; //show that the message was not able to be sent
      break;
    }
    case MFMailComposeResultSaved: {
      errorMessage = @"Message Saved!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show]; //show that the message was saved
      break;
    }
      
    default: {
      errorMessage = @"Unknown Error!";
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Result" message:errorMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
      [alert show]; //show that there was an unknown error from the operating system
    }
    break;
  }
  
  [self dismissModalViewControllerAnimated:YES]; //go back to the view
}

- (void) launchMailApp{
  //This function is a work around if the other mail composition was unsupported
  //We send an email by using html and then parsing it to text
  
  NSString *recipients = @"mailto:person@example.com&subject=The Itinerary"; //set the destination and subject
  NSString *body = @"Here are the places that we are going to go to: \n";
  NSString *tempString; //used to create the email body contents as a temporary text holder
  
  //This loop goes through the activities array and adds them to the body text
  for (int i = 0; i < [selectedActivities count]; i++) {
    tempString = [body stringByAppendingString:[selectedActivities objectAtIndex:i]];
    body = [tempString stringByAppendingString:@"\n"];
  }
  
  NSString *email = [NSString stringWithFormat:@"%@%@",recipients,body]; //reform the body text
  
  email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //encode the body text
  
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]]; //open the device's mail app
}

@end
