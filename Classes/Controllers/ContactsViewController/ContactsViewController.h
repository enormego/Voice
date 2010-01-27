//
//  ContactsViewController.h
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "WebViewController.h"


@interface ContactsViewController : WebViewController {
@private
	UISegmentedControl* titleSegmentedControl;
}

- (IBAction)toggleContacts;

@property(nonatomic,retain) IBOutlet UISegmentedControl* titleSegmentedControl;
@end
