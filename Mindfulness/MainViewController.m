//
//  MainViewController.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "TimeViewController.h"
#import "NotificationViewController.h"
#import "InfoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{  
    if (self.navigationController.navigationBar.hidden == NO)
    {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        self.RemindMeLabel.text = NSLocalizedString(@"Remind Me", nil);
        self.aboutMySessionsLabel.text = NSLocalizedString(@"about my sessions", nil);
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setRemindMeLabel:nil];
    [self setAboutMySessionsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)addTimeViewController:(id)sender {
    
    TimeViewController *timeViewController = [[TimeViewController alloc] init];
    
    [[self navigationController] pushViewController:timeViewController animated:YES];
    
}

- (IBAction)addNotificationViewController:(id)sender {
    
    NotificationViewController * notificationViewController = [[NotificationViewController alloc] init];
    
    [[self navigationController] pushViewController:notificationViewController animated:YES];
    
}

- (IBAction)addInfoViewController:(id)sender {
    
    InfoViewController *infoViewController = [[InfoViewController alloc] init];
    
    [[self navigationController] pushViewController:infoViewController animated:YES];
}


@end
