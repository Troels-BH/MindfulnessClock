//
//  InfoViewController.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *infoTextView;

- (IBAction)removeInfoViewController:(id)sender;

@end
