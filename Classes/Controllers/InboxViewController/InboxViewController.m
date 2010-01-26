//
//  InboxViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "InboxViewController.h"
#import "ComposeViewController.h"
#import "ConversationViewController.h"


@implementation InboxViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	self.title = @"Inbox";
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self loadURL:[NSURL URLWithString:@"https://www.google.com/voice/m?dc=gorganic#voice:s=inbox&l=inbox"]];
}

- (IBAction)composeNewSMS {
	ComposeViewController* composeViewController = [[ComposeViewController alloc] init];
	UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:composeViewController];
	navigationController.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
	[self presentModalViewController:navigationController animated:YES];
	[navigationController release];
	[composeViewController release];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if([[[request URL] description] rangeOfString:@"s=conversation"].location != NSNotFound) {
		ConversationViewController* viewController = [[ConversationViewController alloc] initWithURL:[request URL]];
		[self.navigationController pushViewController:viewController animated:YES];
		[viewController release];
		return NO;		
	} else {
		return [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
