//
//  WebViewController.h
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController<UIWebViewDelegate> {
@private
	BOOL allowScrolling;
	UIImageView* placeHolderImageView;
	CGPoint scrollPosition;
}

// Global web view thats reused across all webViews
+ (UIWebView*)globalWebView;

- (void)loadURL:(NSURL*)URL;

// Subclasses should remove UI elements specifically targeted to their URL and must call back to super
// Do not call directly, WebViewController will call as needed
- (void)cleanUpUI;

@property(nonatomic,readonly) UIWebView* webView;
@property(nonatomic,assign) BOOL allowScrolling;
@property(nonatomic,readonly) NSURL* defaultURL;
@property(nonatomic,assign) CGPoint scrollPosition;
@end
