//
//  VoiceAppDelegate.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright enormego 2010. All rights reserved.
//

#import "VoiceAppDelegate.h"


@implementation VoiceAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	tabBarController.selectedViewController = [[tabBarController viewControllers] objectAtIndex:1];
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

