/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
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


//API
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


@end
