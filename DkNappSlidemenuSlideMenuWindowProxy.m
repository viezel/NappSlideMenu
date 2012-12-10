/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiBase.h"
#import "DkNappSlidemenuSlideMenuWindowProxy.h"
#import "DkNappSlidemenuSlideMenuWindow.h"
#import "TiUtils.h"


@implementation DkNappSlidemenuSlideMenuWindowProxy


-(TiUIView*)newView
{
    NSLog(@"proxy newView");
	return [[DkNappSlidemenuSlideMenuWindow alloc] init];
}

- (UIViewController *)childViewController
{
    NSLog(@"proxy childViewController");
	return [(DkNappSlidemenuSlideMenuWindow*)[self view] controller];
}

-(void)windowDidOpen
{
    NSLog(@"proxy windowDidOpen");
	[super windowDidOpen];
	[self reposition];
}

-(void)windowWillClose
{
    [super windowWillClose];
}


-(TiOrientationFlags)orientationFlags
{
    TiOrientationFlags orientations = [super orientationFlags];
    if (orientations == TiOrientationNone) {
        orientations = [detailView orientationFlags];
    }
	return orientations;
}



//PUBLIC API

-(void)setCenterWindow:(id<NSObject,TiOrientationController>)newDetailView
{
	ENSURE_UI_THREAD_1_ARG(newDetailView);
	NSLog(@"DkNappSlidemenuSlideMenuWindowProxy setCenterWindow!");
    if (newDetailView == detailView)
	{
		return;
	}
	[detailView setParentOrientationController:nil];
	[newDetailView setParentOrientationController:self];
	RELEASE_AND_REPLACE(detailView,newDetailView);
	[self replaceValue:newDetailView forKey:@"centerWindow" notification:YES];
}





@end
