//
//  NotificationsTableViewCell.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 03/10/12.
//
//

#import <UIKit/UIKit.h>

@interface NotificationsTableViewCell : UITableViewCell {
    
    UILabel *notificationText;
    UILabel *notificationTime;
    UILabel *notificationDays;
    UIImageView *backgroundImageView;
}

@property (nonatomic, retain) IBOutlet UILabel *notificationText;
@property (nonatomic, retain) IBOutlet UILabel *notificationTime;
@property (nonatomic, retain) IBOutlet UILabel *notificationDays;
@property (nonatomic, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
