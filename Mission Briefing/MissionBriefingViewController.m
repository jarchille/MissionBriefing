//
//  ViewController.m
//  Mission Briefing
//
//  Created by Ben Gohlke on 1/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "MissionBriefingViewController.h"

@interface MissionBriefingViewController ()
    
    @property (strong, nonatomic) IBOutlet UITextField *agentNameTextField;
    @property (strong, nonatomic) IBOutlet UITextField *agentPasswordTextField;
    @property (strong, nonatomic) IBOutlet UILabel *greetingLabel;
    @property (strong, nonatomic) IBOutlet UITextView *missionBriefingTextView;
    
- (IBAction)authenticateAgent:(UIButton *)sender;
    
    @end

@implementation MissionBriefingViewController
    
- (void)viewDidLoad
    {
        [super viewDidLoad];
        
        [self.agentNameTextField setText: @""];
        self.agentNameTextField.placeholder = @"Enter name...";
        self.agentPasswordTextField.placeholder = @"Enter password...";
        self.greetingLabel.text = @"";
        self.missionBriefingTextView.text = @"";
    }
    
- (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
- (IBAction)authenticateAgent:(UIButton *)sender
    {
        
        if ([self.agentNameTextField isFirstResponder])
        {
            [self.agentNameTextField resignFirstResponder];
        }
        
        if (![self.agentNameTextField  isEqual: @""] && ![self.agentPasswordTextField  isEqual: @""])
        {
            
            
            NSString *agentName = self.agentNameTextField.text;
            
            NSString *agentLastName = ([agentName componentsSeparatedByString: @" "])[1];
            self.greetingLabel.text = agentLastName;
            
            self.missionBriefingTextView.text = [NSString stringWithFormat:@"This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent %@, you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds.", agentLastName];
            
            
            UIColor *authenticatedBackgroundColor = [UIColor colorWithRed: 0.585 green: 0.78 blue: 0.188 alpha: 1];
            
            self.view.backgroundColor = authenticatedBackgroundColor;
        }
        else
        {
            UIColor *accessDeniedBackgroundColor = [UIColor colorWithRed: 0.78 green: 0.78 blue: 0.188 alpha: 1];
            
            self.view.backgroundColor = accessDeniedBackgroundColor;
        }
    }
    
    
    @end
