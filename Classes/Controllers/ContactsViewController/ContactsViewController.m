//
//  ContactsViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactViewController.h"

static UIWebView* __contactsWebView;

@implementation ContactsViewController
@synthesize titleSegmentedControl;

// Contacts is actually run through a different app than the main GV app.
// Google uses an iframe in the main app, so we'll call directly
+ (UIWebView*)globalWebView {
	@synchronized(self) {
		if(!__contactsWebView) {
			__contactsWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
			__contactsWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
			__contactsWebView.backgroundColor = [UIColor whiteColor];
			
			for(UIImageView* imageView in [[[__contactsWebView subviews] lastObject] subviews]) {
				if(![imageView isKindOfClass:[UIImageView class]]) continue;
				imageView.hidden = YES;
			}
		}
	}

	return __contactsWebView;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Contacts" style:UIBarButtonItemStyleBordered target:nil action:NULL] autorelease];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[self toggleContacts];
	[super viewDidAppear:animated];
}

- (IBAction)toggleContacts {
	if(self.titleSegmentedControl.selectedSegmentIndex == 1) {
		[self.webView stringByEvaluatingJavaScriptFromString:@"var evt = document.createEvent('MouseEvents');evt.initEvent('click', true, true);_e(evt,'cmy');"];
	} else {
		[self.webView stringByEvaluatingJavaScriptFromString:@"var evt = document.createEvent('MouseEvents');evt.initEvent('click', true, true);_e(evt,'ctp');"];
	}
	
	[self cleanUpUI];
}

- (void)cleanUpUI {
	// No need to call super here, since it's a different webapp
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('cl-chrome').style.display='none';"];
}

- (NSURL*)defaultURL {
	return [NSURL URLWithString:@"https://www.google.com/app/contacts"];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	if([[[request URL] description] rangeOfString:@":v=hc"].location != NSNotFound) {
		ContactViewController* viewController = [[ContactViewController alloc] initWithURL:[request URL]];
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
	self.titleSegmentedControl = nil;
}


- (void)dealloc {
	self.titleSegmentedControl = nil;
    [super dealloc];
}


@end
