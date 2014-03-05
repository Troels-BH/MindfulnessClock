//
//  AddNotificationViewController.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationsView.h"

@interface AddNotificationViewController : UIViewController <NotificationsViewDelegate> {
    
    BOOL sunday;
    BOOL monday;
    BOOL tuesday;
    BOOL wednesday;
    BOOL thursday;
    BOOL friday;
    BOOL saturday;
    
    BOOL notificationViewVisible;
    BOOL notificationViewAnimationFinish;
    
    NSArray *existingNotificationsArray;
    NSMutableArray *existingNotificationAlertBody;
    NSMutableArray *existingNotificationFireDate;
    
    NSMutableArray *notificationFuture;
    
    NSArray *daysToRepeat;
}

@property (weak, nonatomic) IBOutlet NotificationsView *notificationsView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UIButton *deleteHowleButton;
@property (weak, nonatomic) IBOutlet UIButton *repeatButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (nonatomic, retain) NSArray *existingNotificationsArray;
@property (nonatomic, retain) NSMutableArray *existingNotificationAlertBody;
@property (nonatomic, retain) NSMutableArray *existingNotificationFireDate;


- (IBAction)switchNotificationView:(id)sender;
- (IBAction)addNotification:(id)sender;
- (IBAction)removeAddNotificationViewController:(id)sender;
- (void)setChosenDays:(NSArray *)daysArray:(BOOL)today;
- (IBAction)deleteHowleNotification;

@end
