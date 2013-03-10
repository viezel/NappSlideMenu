/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
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
-(void)rightViewPushViewControllerOverCenterController:(id)args;
-(NSNumber *)canRightViewPushViewControllerOverCenterController:(id)args;

@end
