//
//  ContactsViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "ContactsViewController.h"


@implementation ContactsViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	self.title = @"Contacts";
}

- (NSURL*)defaultURL {
	return [NSURL URLWithString:@"https://www.google.com/voice/m?dc=gorganic#~contacts:v=cl&m=v"];
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
