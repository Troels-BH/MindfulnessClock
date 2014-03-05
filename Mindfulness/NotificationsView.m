//
//  NotificationsView.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 8/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NotificationsView.h"

@implementation NotificationsView

@synthesize delegate = _delegate;
@synthesize daysToRepeat = _daysToRepeat;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layout];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self layout];
    }
    
    return self;
}

- (void)layout {
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RepeatBackgroundView.png"]];
    [self addSubview:backgroundImageView];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin]; 
    [button setFrame:CGRectMake(self.frame.size.width-81-20, 22, 81, 46)];
    [button setImage:[UIImage imageNamed:@"DownButton.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:10];
    [self addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(175, 185, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:1];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(210, 186, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Sunday", nil)];
    [self addSubview:label];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 25, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:2];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(55, 26, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Monday", nil)];
    [self addSubview:label];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 65, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:3];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(55, 66, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Tuesday", nil)];
    [self addSubview:label];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 105, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:4];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(55, 106, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Wednesday", nil)];
    [self addSubview:label];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 145, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:5];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(55, 146, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Thursday", nil)];
    [self addSubview:label];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 185, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:6];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(55, 186, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Friday", nil)];
    [self addSubview:label];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(175, 145, 30, 30)];
    [button setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:7];
    [self addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(210, 146, 110, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [label setText:NSLocalizedString(@"Saturday", nil)];
    [self addSubview:label];
}

- (void)button:(id)sender {
    
    [self.delegate notificationsView:self notificationsViewUpdate:sender];
}

- (void)setButtonStatus:(id)sender:(BOOL)status{
    if (status) {
        //[sender setBackgroundColor:[UIColor blueColor]];
        [sender setImage:[UIImage imageNamed:@"CheckButtonYes.png"] forState:UIControlStateNormal];
    } else {
        //[sender setBackgroundColor:[UIColor greenColor]];
        [sender setImage:[UIImage imageNamed:@"CheckButtonNo.png"] forState:UIControlStateNormal];
    }
}

- (void)setButtonStatusByTag:(int)tag {
 
    UIButton *button = (UIButton *)[self viewWithTag:tag];
    //[button setBackgroundColor:[UIColor blueColor]];
    [button setImage:[UIImage imageNamed:@"CheckButtonYes.png"] forState:UIControlStateNormal];
}

- (void)hideDoneButton {
    UIButton *button = (UIButton *)[self viewWithTag:10];
    [button setHidden:YES];
}


@end
