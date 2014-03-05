//
//  AddNotificationViewController.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddNotificationViewController.h"
#import "NotificationViewController.h"

@implementation AddNotificationViewController

@synthesize notificationsView;
@synthesize messageTextField;
@synthesize repeatButton;
@synthesize timePicker;
@synthesize existingNotificationsArray, existingNotificationAlertBody, existingNotificationFireDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [repeatButton setTitle:NSLocalizedString(@"Repeat", nil) forState:UIControlStateNormal];
    
    self.notificationsView.delegate = self;
    self.deleteHowleButton.hidden = YES;
    
    self.messageTextField.placeholder = NSLocalizedString(@"Message", nil);
    
    [super viewDidLoad];
    
    
    notificationViewAnimationFinish = YES;
}

- (BOOL)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (notificationViewVisible) {
        
        notificationViewVisible = NO;
        [timePicker setEnabled:YES];
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             [notificationsView setFrame:CGRectMake( 0.0, self.view.frame.size.height, self.view.frame.size.width, 250)];
                         }
                         completion:^(BOOL finished) {
                             notificationViewAnimationFinish = YES;
                         }];
        
    }
    
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [messageTextField resignFirstResponder];
    return NO;
}

-(void)notificationsView:(NotificationsView *)notificationsView notificationsViewUpdate:(id)sender {
    int day = [sender tag];
    
    switch (day) {
        case 1:
            if (sunday) {
                sunday = NO;
            } else {
                sunday = YES;
            }
            [self.notificationsView setButtonStatus:sender :sunday];
            break;
        case 2:
            if (monday) {
                monday = NO;
            } else {
                monday = YES;
            }
            [self.notificationsView setButtonStatus:sender :monday];
            break;
        case 3:
            if (tuesday) {
                tuesday = NO;
            } else {
                tuesday = YES;
            }
            [self.notificationsView setButtonStatus:sender :tuesday];
            break;
        case 4:
            if (wednesday) {
                wednesday = NO;
            } else {
                wednesday = YES;
            }
            [self.notificationsView setButtonStatus:sender :wednesday];
            break;
        case 5:
            if (thursday) {
                thursday = NO;
            } else {
                thursday = YES;
            }
            [self.notificationsView setButtonStatus:sender :thursday];
            break;
        case 6:
            if (friday) {
                friday = NO;
            } else {
                friday = YES;
            }
            [self.notificationsView setButtonStatus:sender :friday];
            break;
        case 7:
            if (saturday) {
                saturday = NO;
            } else {
                saturday = YES;
            }
            [self.notificationsView setButtonStatus:sender :saturday];
            break;
        case 10:
            [self switchNotificationView:self];
            break;

        default:
            break;
    }
}


- (IBAction)switchNotificationView:(id)sender {
    
    if (!notificationViewAnimationFinish) {
        return;
    }
    
    notificationViewAnimationFinish = NO;
    
    int delayWeekdaysView = 0;
    
    if (messageTextField.isFirstResponder) {
        [messageTextField resignFirstResponder];
        delayWeekdaysView = 0.95;
    }
    
    if (!notificationViewVisible) {
        
        notificationViewVisible = YES;
        [timePicker setEnabled:NO];
    
        [UIView animateWithDuration:0.5 
                          delay:delayWeekdaysView
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         [notificationsView setFrame:CGRectMake( 0.0, self.view.frame.size.height - 224, self.view.frame.size.width, 250)];
                     }
                        completion:^(BOOL finished) {
                             notificationViewAnimationFinish = YES;
                         }];
    } else {
        
        notificationViewVisible = NO;
        [timePicker setEnabled:YES];
        
        [UIView animateWithDuration:0.5 
                              delay:delayWeekdaysView
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             [notificationsView setFrame:CGRectMake( 0.0, self.view.frame.size.height, self.view.frame.size.width, 250)];
                         }
                         completion:^(BOOL finished) {
                             notificationViewAnimationFinish = YES;
                         }];
        
    }
}

- (IBAction)addNotification:(id)sender {
    
    if ([self.messageTextField.text isEqualToString:@""]) {
        self.messageTextField.text = NSLocalizedString(@"Remember My Mnf session", nil);
    }
    
    NSDate *choosenDate = [[NSDate alloc] init];
    choosenDate = self.timePicker.date;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:choosenDate];
    int weekday = [weekdayComponents weekday];
    
    NSDateFormatter *dateFormatterCheck = [[NSDateFormatter alloc] init];
    [dateFormatterCheck setDateFormat:@"yyyy-mm-dd HH:MM"];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    if (sunday) {
        int iOffsetToSunday = -weekday + 1;
        weekdayComponents.weekday = iOffsetToSunday;
        NSDate *lastSunday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastSunday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (monday) {
        int iOffsetToMonday = -weekday + 2;
        weekdayComponents.weekday = iOffsetToMonday;
        NSDate *lastMonday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastMonday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (tuesday) {
        int iOffsetToTuesday = -weekday + 3;
        weekdayComponents.weekday = iOffsetToTuesday;
        NSDate *lastTuesday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastTuesday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (wednesday) {
        int iOffsetToWednesday = -weekday + 4;
        weekdayComponents.weekday = iOffsetToWednesday;
        NSDate *lastWednesday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastWednesday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (thursday) {
        int iOffsetToThursday = -weekday + 5;
        weekdayComponents.weekday = iOffsetToThursday;
        NSDate *lastThursday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastThursday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (friday) {
        int iOffsetToFriday = -weekday + 6;
        weekdayComponents.weekday = iOffsetToFriday;
        NSDate *lastFriday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastFriday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (saturday) {
        int iOffsetToSaturday = -weekday + 7;
        weekdayComponents.weekday = iOffsetToSaturday;
        NSDate *lastSaturday = [[NSCalendar currentCalendar] dateByAddingComponents:weekdayComponents toDate:choosenDate options:0];
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = lastSaturday;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.repeatInterval = NSWeekCalendarUnit;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    if (!sunday && !monday && !tuesday && !wednesday && !thursday && !friday && !saturday) {
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = self.timePicker.date;
        localNotification.alertBody = self.messageTextField.text;
        localNotification.soundName = @"xylophone.wav";
        localNotification.applicationIconBadgeNumber = 1;
        
        NSLog(@"date: %@", self.timePicker.date);
        NSLog(@"firedate: %@", localNotification);
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)setChosenDays:(NSArray *)daysArray:(BOOL)today{
    daysToRepeat = daysArray;
    
    if (today) {
        
        UILocalNotification *notification = [daysToRepeat objectAtIndex:0];
        
        [self.timePicker setDate:notification.fireDate];
        [self.messageTextField setText:notification.alertBody];
        [self.deleteHowleButton setHidden:NO];
        [self.backButton setHidden:YES];
        
        NSLog(@"--%@", notification);
        
        [[UIApplication sharedApplication] cancelLocalNotification:notification];
        
    } else {
        
        for (int i = 0; i < [daysToRepeat count]; i ++) {
            UILocalNotification *notification = [daysToRepeat objectAtIndex:i];
        
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
            NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:notification.fireDate];
            int weekday = [weekdayComponents weekday];
        
            switch (weekday) {
                case 1:
                    sunday = YES;
                    break;
                case 2:
                    monday = YES;
                    break;
                case 3:
                    tuesday = YES;
                    break;
                case 4:
                    wednesday = YES;
                    break;
                case 5:
                    thursday = YES;
                    break;
                case 6:
                    friday = YES;
                    break;
                case 7:
                    saturday = YES;
                    break;
                
                default:
                    break;
            }
        
            [self.notificationsView setButtonStatusByTag:weekday];
            [self.timePicker setDate:notification.fireDate];
            [self.messageTextField setText:notification.alertBody];
            [self.deleteHowleButton setHidden:NO];
            [self.backButton setHidden:YES];
        }
    }
    
    for (int i = 0; i < [daysToRepeat count]; i ++) {
        UILocalNotification *notificationToDelete = [daysToRepeat objectAtIndex:i];
        [[UIApplication sharedApplication] cancelLocalNotification:notificationToDelete];
    }
}

- (IBAction)deleteHowleNotification {

    for (int i = 0; i < [daysToRepeat count]; i ++) {
        [[UIApplication sharedApplication] cancelLocalNotification:[daysToRepeat objectAtIndex:i]];
    }
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)removeAddNotificationViewController:(id)sender {
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    [self setNotificationsView:nil];
    [self setTimePicker:nil];
    [self setMessageTextField:nil];
    [self setRepeatButton:nil];
    [self setDeleteHowleButton:nil];
    [self setBackButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)deleteHowleButton:(id)sender {
}
@end
