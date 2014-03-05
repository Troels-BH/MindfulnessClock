//
//  TimeViewController.h
//  Mindfulness
//
//  Created by Troels Bech Hansen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController {
    
    int delayTime;
    int sessionTime;
    
    NSArray *soundArray;
    NSArray *soundNameArray;
    int chosenSoundIndex;
}

- (IBAction)addNextViewController:(id)sender;
- (IBAction)goBackToMainViewController:(id)sender;

- (IBAction)startSessionIn:(id)sender;
- (IBAction)endSessionIn:(id)sender;
- (IBAction)chooseSound:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *delayLable;
@property (weak, nonatomic) IBOutlet UILabel *sessionLable;
@property (weak, nonatomic) IBOutlet UILabel *soundLable;

@property (weak, nonatomic) IBOutlet UILabel *startSessionInLabel;
@property (weak, nonatomic) IBOutlet UILabel *endSessionInLable;
@property (weak, nonatomic) IBOutlet UILabel *sessionSoundLabel;
@property (weak, nonatomic) IBOutlet UILabel *secLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;


@end
