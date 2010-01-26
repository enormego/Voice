//
//  VoiceAppDelegate.h
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright enormego 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoiceAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
