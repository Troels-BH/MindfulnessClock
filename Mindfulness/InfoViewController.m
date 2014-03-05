//
//  InfoViewController.m
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize infoTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[self view] setBackgroundColor:[UIColor redColor]];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    self.infoTextView.text = NSLocalizedString(@"Info text", nil);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setInfoTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)removeInfoViewController:(id)sender {
    
    [[self navigationController] popViewControllerAnimated:YES];
    
}
@end
