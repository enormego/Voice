//
//  SettingsViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "SettingsViewController.h"
#import "PageViewController.h"

@implementation SettingsViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	self.title = @"Settings";
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self loadURL:[NSURL URLWithString:@"https://www.google.com/voice/m?dc=gorganic#voice:s=settings"]];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if([[[request URL] description] rangeOfString:@"s=settings"].location == NSNotFound) {
		PageViewController* viewController = [[PageViewController alloc] initWithURL:[request URL]];
		[self.navigationController pushViewController:viewController animated:YES];
		[viewController release];
		return NO;
	} else {
		return [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
	}
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
