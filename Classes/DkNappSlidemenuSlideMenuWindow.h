/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiBase.h"
#import "TiUIView.h"
#import "IIViewDeckController.h"

UIViewController * NappControllerForProxy(TiViewProxy * proxy);

@interface DkNappSlidemenuSlideMenuWindow : TiUIView {

@private
	IIViewDeckController *controller;
}
-(IIViewDeckController*)controller;

//API
-(void)toggleLeftView:(id)args;
-(void)toggleRightView:(id)args;
-(void)bounceLeftView:(id)args;
-(void)bounceRightView:(id)args;
-(void)bounceTopView:(id)args;
-(void)bounceBottomView:(id)args;
-(void)toggleOpenView:(id)args;

@end
