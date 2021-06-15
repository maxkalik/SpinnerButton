//
//  MKViewController.m
//  SpinnerButton
//
//  Created by maxkalik on 06/08/2021.
//  Copyright (c) 2021 maxkalik. All rights reserved.
//

#import "MKViewController.h"
#import "SpinnerButton.h"

@interface MKViewController ()

@property (weak, nonatomic) IBOutlet SpinnerButton *button;

@end

@implementation MKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // stroke line width
    // self.button.strokeLineWidth = 2;
        
    // single stroke color
    // [self.button setStrokeColor:UIColor.redColor];
    
    // corner radius
    // self.button.cornerRadius = 5;
        
    // make gradient with colors
    // NSArray *colors = [[NSArray alloc] initWithObjects:UIColor.blueColor, UIColor.redColor, UIColor.orangeColor, nil];
    // [self.button setStrokeColors:colors];

    // time interval of animation duration
    // self.button.timeInterval = 3;
}

- (IBAction)buttonTapped:(SpinnerButton *)sender
{
    // start loading animation
    [self.button startAnimating];
        
    // stop loading animation
    // [self.button stopAnimating];
}

@end

