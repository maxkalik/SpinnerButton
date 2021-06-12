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

@property (nonatomic, strong) SpinnerButton *button;

@end

@implementation MKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initButton];
    [self setupButtonCommons];
    [self setupButtonConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initButton
{
    self.button = [[SpinnerButton alloc] init];
    [self.view addSubview:self.button];
}

- (void)setupButtonCommons
{
    [self.button setTitle:@"Button" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupButtonConstraints
{
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

- (void)buttonTapped
{
// stroke line width
//    [self.button setStrokeLineWidth:@2];
    
// single stroke color
//    [self.button setStrokeColor:UIColor.redColor];
    
// make gradient with colors
//    NSArray *colors = [[NSArray alloc] initWithObjects:UIColor.blueColor, UIColor.redColor, UIColor.orangeColor, nil];
//    [self.button setStrokeColors:colors];

// time interval of animation duration
//    self.button.timeInterval = 0.5;
    
// start loading animation
    [self.button startAnimating];
    
// stop loading animation
//    [self.button stopAnimating];
}

@end

