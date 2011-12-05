//
//  KanduPickActivityViewController.h
//  Kandu
//
//  Created by Madison Solarana, Ty Morrow, Chris Payne, & Stephen Schwartz
//  Copyright (c) 2011, All rights reserved.
//

#import "KanduMailViewController.h"

@interface KanduPickActivityViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray *locatedActivities; //activities found on the map
@property (weak, nonatomic) IBOutlet UITableView *locationTable; //table to store the activities
@property (weak, nonatomic) IBOutlet UIButton *emailButton; //email function button
@property (nonatomic, retain) NSArray *selActivities; //stores the selected activites 

@end
