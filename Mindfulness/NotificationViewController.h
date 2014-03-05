//
//  NotificationViewController.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationsTableViewCell.h"


@interface NotificationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>  {
    NSArray *notificationsArray;
    NSMutableArray *sortedAlertBodyArray;
    NSMutableArray *sortedTimeArray;
    NSMutableArray * sortedNotificationsArray;
    
    NotificationsTableViewCell * notificationTableViewCell;
}

@property (nonatomic, retain) NSArray *notificationsArray;
@property (nonatomic, retain) NSMutableArray *sortedAlertBodyArray;
@property (nonatomic, retain) NSMutableArray *sortedTimeArray;
@property (nonatomic, retain) NSMutableArray *sortedNotificationsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lable;

- (IBAction)addNotificationViewController:(id)sender;
- (IBAction)removeNotificationViewController:(id)sender;
- (void)updateData;

@end
