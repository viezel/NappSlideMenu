/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "DkNappSlidemenuSlideMenuWindowProxy.h"

#import "TiBase.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation DkNappSlidemenuSlideMenuWindowProxy

-(void)windowDidOpen {
	[super windowDidOpen];
	[self reposition];
}

-(IIViewDeckController *)_controller {
	return [(DkNappSlidemenuSlideMenuWindow*)[self view] controller];
}

-(TiUIView*)newView {
	return [[DkNappSlidemenuSlideMenuWindow alloc] init];
}


# pragma ViewDeck Delegates

- (void)viewDeckController:(IIViewDeckController*)viewDeckController willOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated
{
	NSString *viewOpened;
	
	if (viewDeckSide == IIViewDeckRightSide) {
		viewOpened = @"right";
	} else if (viewDeckSide == IIViewDeckLeftSide) {
		viewOpened = @"left";
	}
	if ([self _hasListeners:@"viewWillOpen"]) {
		[self fireEvent:@"viewWillOpen" withObject:@{ @"view": viewOpened } propagate:YES];
	}
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated
{
	NSString *viewClosed;
	
	if (viewDeckSide == IIViewDeckRightSide) {
		viewClosed = @"right";
	} else if (viewDeckSide == IIViewDeckLeftSide) {
		viewClosed = @"left";
	}
	if ([self _hasListeners:@"viewWillClose"]) {
		[self fireEvent:@"viewWillClose" withObject:@{ @"view": viewClosed } propagate:YES];
	}
}

- (void)viewDeckController:(IIViewDeckController*)viewDeckController didOpenViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated
{
    NSString *viewClosed;
	if (viewDeckSide == IIViewDeckRightSide) {
		viewClosed = @"right";
	} else if (viewDeckSide == IIViewDeckLeftSide) {
		viewClosed = @"left";
	}
	if ([self _hasListeners:@"viewDidOpen"]) {
		[self fireEvent:@"viewDidOpen" withObject:@{ @"view": viewClosed } propagate:YES];
	}
}

- (void)viewDeckController:(IIViewDeckController*)viewDeckController didCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated
{
    NSString *viewClosed;
	if (viewDeckSide == IIViewDeckRightSide) {
		viewClosed = @"right";
	} else if (viewDeckSide == IIViewDeckLeftSide) {
		viewClosed = @"left";
	}
	if ([self _hasListeners:@"viewDidClose"]) {
		[self fireEvent:@"viewDidClose" withObject:@{ @"view": viewClosed } propagate:YES];
	}
}

- (void)viewDeckController:(IIViewDeckController*)viewDeckController didChangeOffset:(CGFloat)offset orientation:(IIViewDeckOffsetOrientation)orientation panning:(BOOL)panning
{    
    NSString *ori;
	if (orientation == IIViewDeckHorizontalOrientation) {
		ori = @"horizontal";
	} else if (orientation == IIViewDeckVerticalOrientation) {
		ori = @"vertical";
	}
	if ([self _hasListeners:@"didChangeOffset"]) {
		[self fireEvent:@"didChangeOffset" withObject:@{ @"orientation": ori, @"panning":NUMBOOL(panning), @"offset":NUMFLOAT(offset) } propagate:YES];
	}
}

- (void)viewDeckController:(IIViewDeckController*)viewDeckController didShowCenterViewFromSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated
{
    NSString *centerView;
	if (viewDeckSide == IIViewDeckRightSide) {
		centerView = @"right";
	} else if (viewDeckSide == IIViewDeckLeftSide) {
		centerView = @"left";
	}
	if ([self _hasListeners:@"centerViewDidShow"]) {
		[self fireEvent:@"centerViewDidShow" withObject:@{ @"view": centerView } propagate:YES];
	}
}


# pragma API

-(void)toggleLeftView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] toggleLeftView:args];}, NO);
}

-(void)toggleRightView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] toggleRightView:args];}, NO);
}

-(void)bounceLeftView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] bounceLeftView:args];}, NO);
}

-(void)bounceRightView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] bounceRightView:args];}, NO);
}

-(void)bounceTopView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] bounceTopView:args];}, NO);
}

-(void)bounceBottomView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] bounceBottomView:args];}, NO);
}

-(void)toggleOpenView:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] toggleOpenView:args];}, NO);
}

/* - NOT WORKING
-(void)rightViewPushViewControllerOverCenterController:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] rightViewPushViewControllerOverCenterController:args];}, NO);
}
-(NSNumber *)canRightViewPushViewControllerOverCenterController:(id)args {
    TiThreadPerformOnMainThread(^{[(DkNappSlidemenuSlideMenuWindow*)[self view] canRightViewPushViewControllerOverCenterController:args];}, NO);
}*/


@end
