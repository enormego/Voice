//
//  DialerViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "DialerViewController.h"


@implementation DialerViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	self.title = @"Dialer";
	self.allowScrolling = NO;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (NSURL*)defaultURL {
	return [NSURL URLWithString:@"https://www.google.com/voice/m?dc=gorganic#~voice:s=dialer"];
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
