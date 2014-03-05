//
//  SessionViewController.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SessionViewController.h"
#import <AudioToolbox/AudioToolbox.h>


@implementation SessionViewController
@synthesize countdownLable;
@synthesize pausePlay;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        pause = NO;
        startSound = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].idleTimerDisabled=YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)startSessionWith:(int)delay :(int)session :(NSString *)sound
{
    delaySession = delay;
    sessionInSeconds = session * 60;
    
    if (delay > 0) {
        countdownMode = YES;
        [countdownLable setText:[NSString stringWithFormat:@"%d", delaySession]];
    } else {
        countdownMode = NO;
    }
    
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(handleTimerTick) userInfo: nil repeats: YES];
    
    soundEffect = sound;
}

- (void)handleTimerTick
{
    //calculate raw session time to minutes and seconds
    sessionMinutes = floor(sessionInSeconds/60);
    sessionSeconds = trunc(sessionInSeconds - sessionMinutes * 60);
    
    if (!pause) {
        if (countdownMode) {
            if (delaySession == 1) {
                countdownMode = NO;
                
                delaySession --;
                [countdownLable setText:[NSString stringWithFormat:@"%d", delaySession]];
            } else {
                delaySession --;
                [countdownLable setText:[NSString stringWithFormat:@"%d", delaySession]];
            }
        } else {
            if (sessionInSeconds == 0) {
                //play endSound
                [self playSound];
                
                [self customBack:nil];
            } else {
                sessionInSeconds --;
                
                
                if (startSound) {
                    [self playSound];
                    startSound = NO;
                }
            }
        
            [countdownLable setText:[NSString stringWithFormat:@"%d:%02d", sessionMinutes, sessionSeconds]];
        }
    }
}

- (void)playSound
{

    //Convert a NSString in to CFStringRef
    CFStringRef soundCFString = (__bridge CFStringRef)soundEffect;
    
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle, soundCFString, CFSTR("wav"), NULL);
    
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (IBAction)customBack:(id)sender {
    [countdownTimer invalidate];
    [UIApplication sharedApplication].idleTimerDisabled=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pauseOrPlay:(id)sender {
    if (pause) {
        pause = NO;
        [pausePlay setBackgroundImage:[UIImage imageNamed:@"PauseButton.png"] forState:UIControlStateNormal];
    } else {
        pause = YES;
        [pausePlay setBackgroundImage:[UIImage imageNamed:@"PlayButton.png"] forState:UIControlStateNormal];
    }
}

- (void)viewDidUnload
{
    [self setCountdownLable:nil];
    [self setPausePlay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
