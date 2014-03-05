//
//  SessionViewController.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionViewController : UIViewController {
    
    NSTimer *countdownTimer;
    int delaySession;
    int sessionInSeconds;
    int sessionMinutes;
    int sessionSeconds;
    
    BOOL countdownMode;
    BOOL pause;
    
    BOOL startSound;
    NSString *soundEffect;
}
@property (weak, nonatomic) IBOutlet UILabel *countdownLable;
@property (weak, nonatomic) IBOutlet UIButton *pausePlay;


- (IBAction)customBack:(id)sender;
- (IBAction)pauseOrPlay:(id)sender;

- (void)startSessionWith:(int)delay: (int)session: (NSString *)sound;
- (void)handleTimerTick;
- (void)playSound;

@end
