//
//  NotificationViewController.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NotificationViewController.h"
#import "AddNotificationViewController.h"
#import "NotificationsTableViewCell.h"


@implementation NotificationViewController
@synthesize tableView, notificationsArray, sortedAlertBodyArray, sortedNotificationsArray, sortedTimeArray, lable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateData];
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self updateData];
    [self.tableView reloadData];
}

- (void)updateData {
    self.notificationsArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    self.sortedAlertBodyArray = [[NSMutableArray alloc] init];
    self.sortedNotificationsArray = [[NSMutableArray alloc] init];
    self.sortedTimeArray = [[NSMutableArray alloc] init];

    NSDateFormatter *dateFormatterClock = [[NSDateFormatter alloc] init];
    [dateFormatterClock setDateFormat:@"hh:mm"];
    
    for (int i = 0; i < [self.notificationsArray count]; i ++) {
        UILocalNotification *notification = [self.notificationsArray objectAtIndex:i];
        
        NSString *time = [dateFormatterClock stringFromDate:notification.fireDate];
        
        if (![self.sortedAlertBodyArray containsObject:notification.alertBody] || ![self.sortedTimeArray containsObject:time]) {
            [self.sortedAlertBodyArray addObject:notification.alertBody];
            [self.sortedTimeArray addObject:time];
            [self.sortedNotificationsArray addObject:notification];
        }
    }
    
    self.lable.hidden = YES;
    
    if ([self.notificationsArray count] == 0) {
        self.lable.text = NSLocalizedString(@"Add a reminder", nil);
        self.lable.hidden = NO;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sortedAlertBodyArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68;
}

- (UITableViewCell *)tableView:(UITableView *)tableViewCell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
	NotificationsTableViewCell *cell = (NotificationsTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NotificationsTableViewCell"
													 owner:self options:nil];
		for (id oneObject in nib) if ([oneObject isKindOfClass:[NotificationsTableViewCell class]])
			cell = (NotificationsTableViewCell *)oneObject;
	}
    
    UILocalNotification *notification = [self.sortedNotificationsArray objectAtIndex:indexPath.row];

    NSDateFormatter *dateFormatterClock = [[NSDateFormatter alloc] init];
    [dateFormatterClock setDateFormat:@"hh:mm"];
    
    NSDateFormatter *dateFormatterDay = [[NSDateFormatter alloc] init];
    [dateFormatterDay setDateFormat:@"EEE"];
    
    NSString *daysText = NSLocalizedString(@"Will repeat:", nil);
    if (notification.repeatInterval) {
        
        for (int i = 0; i < [self.notificationsArray count]; i ++) {
            UILocalNotification *notificationCheck = [self.notificationsArray objectAtIndex:i];
            
            NSDateFormatter *dateFormatterClock = [[NSDateFormatter alloc] init];
            [dateFormatterClock setDateFormat:@"hh:mm"];
            
            NSString *notificationTime = [dateFormatterClock stringFromDate:notification.fireDate];
            NSString *notificationCheckTime = [dateFormatterClock stringFromDate:notificationCheck.fireDate];

            if ([notification.alertBody isEqualToString: notificationCheck.alertBody] && [notificationTime isEqualToString:notificationCheckTime]) {
                
                daysText = [daysText stringByAppendingString:[dateFormatterDay stringFromDate:notificationCheck.fireDate]];
                daysText = [daysText stringByAppendingString:@", "];
            }
        }
    } else {
        daysText = NSLocalizedString(@"Today", nil);
    }
    
	cell.notificationText.text = [notification alertBody];
	cell.notificationTime.text = [dateFormatterClock stringFromDate:notification.fireDate];
    cell.notificationDays.text = daysText;
    
    UIImage *image = [UIImage imageNamed:@"Cell.png"];
    cell.backgroundImageView.image = image;
     
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AddNotificationViewController * addNotificationViewController = [[AddNotificationViewController alloc] init];
    [[self navigationController] pushViewController:addNotificationViewController animated:YES];
    
    NSMutableArray *chosenDays =[[NSMutableArray alloc] init];
    UILocalNotification *notification = [self.sortedNotificationsArray objectAtIndex:indexPath.row];
    
    for (int i = 0; i < [self.notificationsArray count]; i ++) {
        UILocalNotification *notificationCheck = [self.notificationsArray objectAtIndex:i];
        
        NSDateFormatter *dateFormatterClock = [[NSDateFormatter alloc] init];
        [dateFormatterClock setDateFormat:@"hh:mm"];
        
        NSString *notificationTime = [dateFormatterClock stringFromDate:notification.fireDate];
        NSString *notificationCheckTime = [dateFormatterClock stringFromDate:notificationCheck.fireDate];
        
        if ([notification.alertBody isEqualToString: notificationCheck.alertBody]  && [notificationTime isEqualToString:notificationCheckTime]) {
            [chosenDays addObject:notificationCheck];
        }
    }
    
    BOOL today = YES;
    
    if (notification.repeatInterval == NSWeekCalendarUnit) {
        today = NO;
    }
    
    [addNotificationViewController setChosenDays:chosenDays :today];
}

- (IBAction)addNotificationViewController:(id)sender {
    AddNotificationViewController * addNotificationViewController = [[AddNotificationViewController alloc] init];
    
    [[self navigationController] pushViewController:addNotificationViewController animated:YES];
}

- (IBAction)removeNotificationViewController:(id)sender {
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    //[self setTableView:nil];
    [self setLable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
@end
