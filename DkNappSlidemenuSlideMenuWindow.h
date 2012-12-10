/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiBase.h"
#import "TiUIView.h"
#import "IIViewDeckController.h"

@interface DkNappSlidemenuSlideMenuWindow : TiUIView<IIViewDeckControllerDelegate> {

@private
	IIViewDeckController *controller;
}
-(UIViewController*)controller;

@end
