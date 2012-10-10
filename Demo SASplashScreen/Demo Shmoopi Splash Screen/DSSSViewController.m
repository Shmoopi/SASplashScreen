//
//  DSSSViewController.m
//  Demo Shmoopi Splash Screen
//
//  Created by Kramer on 10/4/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "DSSSViewController.h"

// Import the splash screen
#import "SASplashScreen.h"

@interface DSSSViewController ()

@end

@implementation DSSSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Use the Splash Screen
    [self.view addSubview:[[SASplashScreen alloc] initWithDefaultImageinFrame:CGRectZero withAnimationOption:kDefaultAnimation withDuration:4.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
