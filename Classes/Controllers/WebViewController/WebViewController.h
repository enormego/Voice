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
}

- (void)loadURL:(NSURL*)URL;

@property(nonatomic,readonly) UIWebView* webView;
@property(nonatomic,assign) BOOL allowScrolling;
@end
