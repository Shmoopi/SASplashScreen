//
//  SASplashScreen.m
//  Shmoopi Splash Screen
//
//  Created by Kramer on 10/3/12.
//  Copyright (c) 2012 Shmoopi LLC. All rights reserved.
//

#import "SASplashScreen.h"

@interface SASplashScreen ()

// Set up the movie player controller
@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;

@end

@implementation SASplashScreen

@synthesize moviePlayerController = _moviePlayerController;

// Initializes with the default image with a given frame and a fade-out after a certain duration
- (id)initWithDefaultImageinFrame:(CGRect)frame withAnimationOption:(UIViewAnimationOptions)animation withDuration:(NSTimeInterval)splashDuration {
    
    // Check the inputted values
    if (CGRectIsEmpty(frame)) {
        // Empty frame, make it full screen
        frame = [[UIScreen mainScreen] bounds];
    }
    if (!animation) {
        // No animation set, make it default
        animation = UIViewAnimationCurveEaseOut;
    }
    if (!splashDuration) {
        // No duration specified, make it default
        splashDuration = kDefaultSplashDuration;
    }
    
    // Set the frame
    self = [super initWithFrame:frame];
    
    // Set the content mode
    self.contentMode = UIViewContentModeTopLeft;
    
    // Check for self
    if (self) {
        // Find the default image for the orientation
        UIImageView *imageView = [self orientationAwareDefaultImage];
        
        // Check to make sure it's a good imageview
        if (imageView == nil) {
            // No imageview provided
            
            // remove from superview
            [self removeFromSuperview];
            
            // Return self
            return self;
        }
        
        // set the frame of the imageview
        imageView.frame = self.frame;
        
        // Add it to the view
        [self addSubview:imageView];
    }
    
    // Animate the view
    [UIView animateWithDuration:splashDuration
                          delay:0
                        options:animation
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL complete){
                         [self removeFromSuperview];
                     }];
    
    // Return self
    return self;
}

// Initializes with a custom image with a given frame and a fade-out after a certain duration
- (id)initWithCustomImageinFrame:(CGRect)frame withImage:(UIImage *)image withAnimationOption:(UIViewAnimationOptions)animation withDuration:(NSTimeInterval)splashDuration{
    
    // Check the inputted values
    if (CGRectIsEmpty(frame)) {
        // Empty frame, make it full screen
        frame = [[UIScreen mainScreen] bounds];
    }
    if (!animation) {
        // No animation set, make it default
        animation = UIViewAnimationCurveEaseOut;
    }
    if (!splashDuration) {
        // No duration specified, make it default
        splashDuration = kDefaultSplashDuration;
    }
    
    // Set the frame
    self = [super initWithFrame:frame];
    
    // Set the content mode
    self.contentMode = UIViewContentModeTopLeft;
    
    // Check for self
    if (self) {
        // Set the imageview up
        if (!image) {
            // No image received, make it default
            // Find the default image for the orientation
            UIImageView *imageView = [self orientationAwareDefaultImage];
            
            // Check to make sure it's a good imageview
            if (imageView == nil) {
                // No imageview provided
                
                // remove from superview
                [self removeFromSuperview];
                
                // Return self
                return self;
            }
            
            // set the frame of the imageview
            imageView.frame = self.frame;
            
            // Add it to the view
            [self addSubview:imageView];
        } else {
            // Create an imageview and set it to the default retina image
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            // set the frame of the imageview
            imageView.frame = self.frame;
            
            // Add it to the view
            [self addSubview:imageView];
        }
    }
    
    // Animate the view
    [UIView animateWithDuration:splashDuration
                          delay:0
                        options:animation
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL complete){
                         [self removeFromSuperview];
                     }];
    
    // Return self
    return self;
}

// Initializes with a custom image animation with a given frame and a fade-out after a certain duration
- (id)initWithCustomImageAnimationinFrame:(CGRect)frame withImages:(NSArray *)images withAnimationOption:(UIViewAnimationOptions)animation withRepeatCount:(int)repeatCount withAnimationDuration:(NSTimeInterval)animationDuration withDuration:(NSTimeInterval)splashDuration {
    
    // Check the inputted values
    if (CGRectIsEmpty(frame)) {
        // Empty frame, make it full screen
        frame = [[UIScreen mainScreen] bounds];
    }
    if (!animation) {
        // No animation set, make it default
        animation = UIViewAnimationCurveEaseOut;
    }
    if (!splashDuration) {
        // No duration specified, make it default
        splashDuration = kDefaultSplashDuration;
    }
    if (!repeatCount) {
        // No repeat count specified, make it default
        repeatCount = 1;
    }
    if (!images) {
        // No images array provided, revert to default image
        return [self initWithDefaultImageinFrame:CGRectZero withAnimationOption:kDefaultAnimation withDuration:kDefaultSplashDuration];
    }
    
    // Set the frame
    self = [super initWithFrame:frame];
    
    // Set the content mode
    self.contentMode = UIViewContentModeTopLeft;
    
    // Check for self
    if (self) {
        // Create an imageview to show the animations
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
        
        // Set the animations up
        imageView.animationImages = images;
        
        // Set up the repeat count
        imageView.animationRepeatCount = repeatCount;
        
        // Set up the duration
        imageView.animationDuration = animationDuration;
        
        // Add it to the view
        [self addSubview:imageView];
    }
    
    // Animate the view
    [UIView animateWithDuration:splashDuration
                          delay:animationDuration
                        options:animation
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL complete){
                         [self removeFromSuperview];
                     }];
    
    // Return self
    return self;
}

// Initializes with a custom video in a given frame and a fade-out after the video completes
- (id)initWithCustomVideo:(NSString *)movie {
    
    // Check the inputted values
    if (movie == nil || movie.length <= 0 || [[NSFileManager defaultManager] fileExistsAtPath:movie] != TRUE) {
        // No video url provided, or incorrect url provided, just show the default image
        return [self initWithDefaultImageinFrame:CGRectZero withAnimationOption:kDefaultAnimation withDuration:kDefaultSplashDuration];
    }
    
    NSLog(@"Movie URL: %@", [NSURL fileURLWithPath:movie]);
    
    // Set the frame to fullscreen
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Set the content mode
    self.contentMode = UIViewContentModeTopLeft;
    
    // Check for self
    if (self) {
        // Create the media player
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:movie]];
        
        // For 3.2 devices and above
        if ([self.moviePlayerController respondsToSelector:@selector(loadState)]) {
            // Set up the layout and register for notifications
            // Get ready to play
            [self.moviePlayerController prepareToPlay];
            
            // Set the frame
            self.moviePlayerController.view.frame = [[UIScreen mainScreen] bounds];
            
            // Set autoplay
            self.moviePlayerController.shouldAutoplay = YES;
            
            // Set the control style
            [self.moviePlayerController setControlStyle:MPMovieControlStyleNone];
            
            // Set to fullscreen
            [self.moviePlayerController setFullscreen:YES animated:YES];
            
            // Add to the view
            [self addSubview:[self.moviePlayerController view]];
            
            // Set up a notification for the movie player
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerLoadStateChanged:) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        }
        
        // Set up a notification for the movie player
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayerController];
    }
    
    // Return self
    return self;
}

#pragma mark - UIView Methods

// init
- (id)init {
    // Return default
    return [self initWithDefaultImageinFrame:CGRectZero withAnimationOption:kDefaultAnimation withDuration:kDefaultSplashDuration];
}

// initWithFrame
- (id)initWithFrame:(CGRect)frame {
    // Return default
    return [self initWithDefaultImageinFrame:CGRectZero withAnimationOption:kDefaultAnimation withDuration:kDefaultSplashDuration];
}

#pragma mark - Helper Methods

// Find the orientation and return the correct imageview
- (UIImageView *)orientationAwareDefaultImage {
    // Find the orientation
    if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
        // In portrait orientation
        // Check if it's an iPhone
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            // Check to see the screen size
            if ([[UIScreen mainScreen] bounds].size.height == 568.0f) {
                
                // Verify the default image exists
                if ([[NSFileManager defaultManager] fileExistsAtPath:[[NSBundle mainBundle] pathForResource:@"Default-568h@2x" ofType:@"png"]] == FALSE) {
                    // Failed to find default image, exit
                    return nil;
                }
                
                // Create an imageview and set it to the default retina image
                UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default-568h@2x" ofType:@"png"]]];
                
                // Return the imageview
                return imageView;
            } else {
                
                // Verify the default image exists
                if ([[NSFileManager defaultManager] fileExistsAtPath:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]] == FALSE) {
                    // Failed to find default image, exit
                    return nil;
                }
                
                // Create an imageview and set it to the default retina image
                UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]]];
                
                // Return the imageview
                return imageView;
            }// End iPhone Portrait
            
            // It's the iPad, in portrait mode
            
            // Verify the default image exists
            if ([[NSFileManager defaultManager] fileExistsAtPath:[[NSBundle mainBundle] pathForResource:@"Default-Portrait" ofType:@"png"]] == FALSE) {
                // Failed to find default image, exit
                return nil;
            }
            
            // Create an imageview and set it to the default retina image
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default-Portrait" ofType:@"png"]]];
            
            // Return the imageview
            return imageView;
        }// End Portrait
        
        // Landscape mode - both devices
        
        // Verify the default image exists
        if ([[NSFileManager defaultManager] fileExistsAtPath:[[NSBundle mainBundle] pathForResource:@"Default-Landscape" ofType:@"png"]] == FALSE) {
            // Failed to find default image, exit
            return nil;
        }
        
        // Create an imageview and set it to the default retina image
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default-Landscape" ofType:@"png"]]];
        
        // Return the imageview
        return imageView;
    }
    
    // Failed to find the correct image
    return nil;
}

// Movie preload did finish
- (void)moviePlayerLoadStateChanged:(NSNotification*)notification {
    
    // Unless the state is unknown, start playback
    if ([self.moviePlayerController loadState] != MPMovieLoadStateUnknown) {
        
        // Remove the notification
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:self.moviePlayerController];
        
        // Set orienation to landscape
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
        
        // Play the movie (Yaa, play)
        [self.moviePlayerController play];
    }
}

// Movie playback did finish
- (void)moviePlayBackDidFinish:(NSNotification *)notification {
    // Remove the notification
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayerController];
    // Movie finished, make the controller disappear
    self.alpha = 0.0;
    // Remove from the superview
    [self removeFromSuperview];
}

@end
