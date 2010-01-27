//
//  ContactViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/27/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactsViewController.h"

@implementation ContactViewController

+ (UIWebView*)globalWebView {
	return [ContactsViewController globalWebView];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Contact Info";
}

- (void)cleanUpUI {
	// No need to call super here, since it's a different webapp
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('hc-chrome').parentNode.style.marginTop='-10px';"];
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('hc-chrome').parentNode.style.paddingTop='7px';"];
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('hc-chrome').style.display='none';"];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
