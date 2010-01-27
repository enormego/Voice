//
//  PageViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "PageViewController.h"


@implementation PageViewController

- (id)initWithURL:(NSURL*)aURL {
	if((self = [super init])) {
		URL = [aURL retain];
	}
	
	return self;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (NSURL*)defaultURL {
	return URL;
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
	[URL release];
    [super dealloc];
}


@end
