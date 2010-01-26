//
//  PageViewController.h
//  Voice
//
//  Created by Shaun Harrison on 1/26/10.
//  Copyright 2010 enormego. All rights reserved.
//

#import "WebViewController.h"


@interface PageViewController : WebViewController {
@private
	NSURL* URL;
}

- (id)initWithURL:(NSURL*)aURL;

@end
