//
//  KanduPickActivityViewController.h
//  Kandu
//
//  Created by Madison Solarana on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "KanduMailViewController.h"

@interface KanduPickActivityViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSArray *locatedActivities;
@property (weak, nonatomic) IBOutlet UITableView *locationTable;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (nonatomic, retain) NSArray *selActivities;

@end
