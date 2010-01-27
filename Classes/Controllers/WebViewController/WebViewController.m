//
//  WebViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "WebViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface UIView (UIScroller)
@property(nonatomic,assign) BOOL scrollingEnabled;
@property(nonatomic,assign) CGPoint offset;
@end


static UIWebView* __webView;

#define myWebView [[self class] globalWebView]

@implementation WebViewController
@synthesize allowScrolling, scrollPosition;

+ (UIWebView*)globalWebView {
	@synchronized(self) {
		if(!__webView) {
			__webView = [[UIWebView alloc] initWithFrame:CGRectZero];
			__webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
			__webView.backgroundColor = [UIColor whiteColor];
			
			for(UIImageView* imageView in [[[__webView subviews] lastObject] subviews]) {
				if(![imageView isKindOfClass:[UIImageView class]]) continue;
				imageView.hidden = YES;
			}
		}
	}
	
	return __webView;
}

- (id)init {
	if((self = [super init])) {
		self.allowScrolling = YES;
		self.scrollPosition = CGPointZero;
	}
	
	return self;
}


- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	if(!placeHolderImageView) {
		placeHolderImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
		placeHolderImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	}
	
	[self.view insertSubview:placeHolderImageView atIndex:0];
}

- (void)awakeFromNib {
	[super awakeFromNib];
	self.allowScrolling = YES;
	self.scrollPosition = CGPointZero;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	
	[self.view addSubview:myWebView];
	myWebView.frame = self.view.bounds;
	myWebView.delegate = self;
	((UIView*)[[myWebView subviews] lastObject]).scrollingEnabled = self.allowScrolling;
	[self loadURL:self.defaultURL];
	
	if(placeHolderImageView.image) {
		[self.view bringSubviewToFront:placeHolderImageView];
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.view bringSubviewToFront:self.webView];
	((UIView*)[[myWebView subviews] lastObject]).offset = self.scrollPosition;
}

- (void)viewWillDisappear:(BOOL)animated {
	UIGraphicsBeginImageContext(self.view.bounds.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	placeHolderImageView.image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	self.scrollPosition = ((UIView*)[[myWebView subviews] lastObject]).offset;
	
	[self.view bringSubviewToFront:placeHolderImageView];
	[super viewWillDisappear:animated];
}

- (void)loadURL:(NSURL*)URL {
	[self.webView loadRequest:[NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:3600]];
}

- (UIWebView*)webView {
	if([myWebView superview] == self.view) {
		return myWebView;	
	} else {
		return nil;
	}
}

- (NSURL*)defaultURL {
	return [NSURL URLWithString:@"http://m.google.com/voice"];
}

- (void)cleanUpUI {
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('og_head').style.display='none';"];
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('navbar').style.display='none';"];
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('generalSettingsToolbar').style.display='none';"];
	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('footer').style.display='none';"];	
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSLog(@"shouldStartLoadWithRequest:%@ navigationType:%d", request, navigationType);
	[self performSelector:@selector(cleanUpUI) withObject:nil afterDelay:0.05];
	[self performSelector:@selector(cleanUpUI) withObject:nil afterDelay:0.2];
	[self performSelector:@selector(cleanUpUI) withObject:nil afterDelay:0.4];
	[self performSelector:@selector(cleanUpUI) withObject:nil afterDelay:1.0];
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	[self cleanUpUI];
	NSLog(@"webViewDidStartLoad:%@", webView);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[self cleanUpUI];
	NSLog(@"webViewDidFinishLoad:%@", webView);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	NSLog(@"didFailLoadWithError:%@", error);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[placeHolderImageView release], placeHolderImageView = nil;
}


- (void)dealloc {
	[placeHolderImageView release], placeHolderImageView = nil;
    [super dealloc];
}


@end
