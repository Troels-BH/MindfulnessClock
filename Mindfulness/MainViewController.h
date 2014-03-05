//
//  MainViewController.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

- (IBAction)addTimeViewController:(id)sender;
- (IBAction)addNotificationViewController:(id)sender;
- (IBAction)addInfoViewController:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *RemindMeLabel;
@property (weak, nonatomic) IBOutlet UILabel *aboutMySessionsLabel;

@end
