//
//  NotificationsTableViewCell.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 03/10/12.
//
//

#import "NotificationsTableViewCell.h"

@implementation NotificationsTableViewCell

@synthesize notificationDays, notificationText, notificationTime, backgroundImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
