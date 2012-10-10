//
//  SASplashScreen.h
//  Shmoopi Splash Screen
//
//  Created by Kramer on 10/3/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

#define kDefaultSplashDuration  2.0
#define kSplashImageLocation    @"SplashImage"
#define kDefaultAnimation       2

@interface SASplashScreen : UIView

/*  SASplashScreen is a class to easily show a splash screen in your applications, after the original launch image is hidden, which will dissappear after a delay.  You can show either the default image, a custom image, a custom imageview animation, or a video.  
*/

// Initializes with the default image with a given frame and a fade-out after a certain duration
- (id)initWithDefaultImageinFrame:(CGRect)frame withAnimationOption:(UIViewAnimationOptions)animation withDuration:(NSTimeInterval)splashDuration;

// Initializes with a custom image with a given frame and a fade-out after a certain duration
- (id)initWithCustomImageinFrame:(CGRect)frame withImage:(UIImage *)image withAnimationOption:(UIViewAnimationOptions)animation withDuration:(NSTimeInterval)splashDuration;

// Initializes with a custom image animation with a given frame and a fade-out after a certain duration
- (id)initWithCustomImageAnimationinFrame:(CGRect)frame withImages:(NSArray *)images withAnimationOption:(UIViewAnimationOptions)animation withRepeatCount:(int)repeatCount withAnimationDuration:(NSTimeInterval)animationDuration withDuration:(NSTimeInterval)splashDuration;

// Initializes with a custom video in a given frame and a fade-out after the video completes
- (id)initWithCustomVideo:(NSString *)movie;

@end
