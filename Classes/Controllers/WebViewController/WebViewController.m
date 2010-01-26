//
//  WebViewController.m
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "WebViewController.h"

@interface UIView (UIScroller)
@property(nonatomic,assign) BOOL scrollingEnabled;
@property(nonatomic,assign) CGPoint offset;
@end


static UIWebView* __webView;

@implementation WebViewController
@synthesize allowScrolling;

- (id)init {
	if((self = [super init])) {
		self.allowScrolling = YES;
	}
	
	return self;
}


- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)awakeFromNib {
	[super awakeFromNib];
	self.allowScrolling = YES;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	@synchronized(self) {
		if(!__webView) {
			__webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
			__webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
			__webView.backgroundColor = [UIColor whiteColor];
			
			for(UIImageView* imageView in [[[__webView subviews] lastObject] subviews]) {
				if(![imageView isKindOfClass:[UIImageView class]]) continue;
				imageView.hidden = YES;
			}
			
			[__webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.google.com/voice"] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:3600]];
		}
	}
	
	[self.view addSubview:__webView];
	__webView.frame = self.view.bounds;
	__webView.delegate = self;
	((UIView*)[[__webView subviews] lastObject]).scrollingEnabled = self.allowScrolling;
	((UIView*)[[__webView subviews] lastObject]).offset = CGPointZero;
}

- (void)loadURL:(NSURL*)URL {
	[self.webView loadRequest:[NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:3600]];
}

- (UIWebView*)webView {
	if([__webView superview] == self.view) {
		return __webView;	
	} else {
		return nil;
	}
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
