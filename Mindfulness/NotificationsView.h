//
//  NotificationsView.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotificationsView;

UIButton *button;
UILabel *label;

@protocol NotificationsViewDelegate
- (void)notificationsView:(NotificationsView *)notificationsView notificationsViewUpdate:(id)sender;
@end

@interface NotificationsView : UIView 

@property (assign, nonatomic) NSArray *daysToRepeat;
@property (assign) id <NotificationsViewDelegate> delegate;

- (void)layout;
- (void)button:(id)sender;
- (void)setButtonStatus:(id)sender:(BOOL)status;
- (void)setButtonStatusByTag:(int)tag;
- (void)hideDoneButton;

@end
