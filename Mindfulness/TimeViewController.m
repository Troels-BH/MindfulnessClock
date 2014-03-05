//
//  TimeViewController.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeViewController.h"
#import "SessionViewController.h"

@implementation TimeViewController
@synthesize delayLable;
@synthesize sessionLable;
@synthesize soundLable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        delayTime = 5;
        sessionTime = 5;
        soundArray = [NSArray arrayWithObjects:@"xylophone",@"triangle",@"waves",@"whistle" ,nil];
        soundNameArray = [NSArray arrayWithObjects:@"Xylophone",@"Triangle",@"Waves", @"Whistle", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [delayLable setText:[NSString stringWithFormat:@"%d", delayTime]];
    [sessionLable setText:[NSString stringWithFormat:@"%d", sessionTime]];
    chosenSoundIndex = 0;
    
    NSString *soundName = [soundNameArray objectAtIndex:chosenSoundIndex];
    [soundLable setText:NSLocalizedString(soundName, nil)];
    
    self.startSessionInLabel.text = NSLocalizedString(@"Start session in:", nil);
    self.endSessionInLable.text = NSLocalizedString(@"End session in:", nil);
    self.sessionSoundLabel.text = NSLocalizedString(@"Session start and end sound:", nil);
    self.secLabel.text = NSLocalizedString(@"sec", nil);
    self.minLabel.text = NSLocalizedString(@"min", nil);
    
    [super viewDidLoad];
}


- (IBAction)addNextViewController:(id)sender {
    
    SessionViewController *sessionViewController = [[SessionViewController alloc] init];
    [[self navigationController] pushViewController:sessionViewController animated:YES];
    
    [sessionViewController startSessionWith:delayTime :sessionTime :[soundArray objectAtIndex:chosenSoundIndex]];
}

- (IBAction)goBackToMainViewController:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)startSessionIn:(id)sender {

    UIButton *button = sender;
    if (button.tag == 1) {
        if (delayTime <= 59) {
            delayTime = delayTime + 5; 
        }
    } else {
        if (!delayTime == 0) {
            delayTime = delayTime - 5;
        }
    }
    
    [delayLable setText:[NSString stringWithFormat:@"%d", delayTime]];
}

- (IBAction)endSessionIn:(id)sender {
    
    UIButton *button = sender;
    if (button.tag == 1) {
        if (sessionTime <= 59) {
            ++sessionTime; 
        }
    } else {
        if (!sessionTime == 0) {
            --sessionTime;
        }
    }
    
    [sessionLable setText:[NSString stringWithFormat:@"%d", sessionTime]];
}

- (IBAction)chooseSound:(id)sender {
    int totalSoundArray = [soundArray count] -1;
    
    NSString *soundName;
    
    UIButton *button = sender;
    if (button.tag == 0) {
        if (chosenSoundIndex == 0) {
            chosenSoundIndex = totalSoundArray;
            //[soundLable setText:[soundNameArray objectAtIndex:chosenSoundIndex]];
            soundName = [soundNameArray objectAtIndex:chosenSoundIndex];
            [soundLable setText:NSLocalizedString(soundName, nil)];
        } else {
            chosenSoundIndex --;
            //[soundLable setText:[soundNameArray objectAtIndex:chosenSoundIndex]];
            soundName = [soundNameArray objectAtIndex:chosenSoundIndex];
            [soundLable setText:NSLocalizedString(soundName, nil)];
        }
    } else {
        if (chosenSoundIndex == totalSoundArray) {
            chosenSoundIndex = 0;
            //[soundLable setText:[soundNameArray objectAtIndex:chosenSoundIndex]];
            soundName = [soundNameArray objectAtIndex:chosenSoundIndex];
            [soundLable setText:NSLocalizedString(soundName, nil)];
        } else {
            chosenSoundIndex ++;
            //[soundLable setText:[soundNameArray objectAtIndex:chosenSoundIndex]];
            soundName = [soundNameArray objectAtIndex:chosenSoundIndex];
            [soundLable setText:NSLocalizedString(soundName, nil)];
        }
    }
}

- (void)viewDidUnload
{
    [self setDelayLable:nil];
    [self setSessionLable:nil];
    [self setSoundLable:nil];
    [self setStartSessionInLabel:nil];
    [self setEndSessionInLable:nil];
    [self setSessionSoundLabel:nil];
    [self setSecLabel:nil];
    [self setMinLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
