/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiBase.h"
#import "DkNappSlidemenuSlideMenuWindow.h"
#import "TiUtils.h"
#import "TiViewController.h"

UIViewController * ControllerForViewProxy(TiViewProxy * proxy);

UIViewController * ControllerForViewProxy(TiViewProxy * proxy)
{
	if([proxy respondsToSelector:@selector(controller)])
	{
        //return [(TiWindowProxy *)proxy controller];
	}
    
	[[proxy view] setAutoresizingMask:UIViewAutoresizingNone];
    
	return [[[TiViewController alloc] initWithViewProxy:(TiViewProxy<TiUIViewController>*)proxy] autorelease];
}

@implementation DkNappSlidemenuSlideMenuWindow


-(void)dealloc
{
	RELEASE_TO_NIL(controller);
	[super dealloc];
}

-(UIViewController*)controller
{
	if (controller==nil)
	{
		/*
        UIViewController* leftWindow = [[UIViewController alloc] init];
        UIViewController* rightWindow = [[UIViewController alloc] init];
        UIViewController* centerWindow = [[UIViewController alloc] init];
        UINavigationController* centerController = [[UINavigationController alloc] initWithRootViewController:centerWindow];
        
        controller =  [[IIViewDeckController alloc] initWithCenterViewController:centerController                                                              leftViewController:leftWindow rightViewController:rightWindow];
        */
        
        
        
        TiViewProxy* centerController = [self.proxy valueForUndefinedKey:@"centerWindow"];
		TiViewProxy* leftWindow = [self.proxy valueForUndefinedKey:@"leftWindow"];
        TiViewProxy* rightWindow = [self.proxy valueForUndefinedKey:@"rightWindow"];
        
        NSLog(@"centercontroller: %@", centerController);
        NSLog(@"leftWindow %@", leftWindow);
        
        UINavigationController* centerNavController = [[UINavigationController alloc] initWithRootViewController:ControllerForViewProxy(centerController)];
        
        NSLog(@"uiViewController %@", ControllerForViewProxy(centerController));
        UIViewController *viewController = [[UIViewController alloc] init];
        [viewController navigationController:centerNavController];
        viewController.n
        
        controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController) leftViewController:ControllerForViewProxy(leftWindow) ];

        
        //[super initWithCenterViewController:photosController leftViewController:selectionController]
        controller.delegate = self;
        
        /*
        if(leftWindow != nil){
            if(rightWindow != nil){
                //both
                controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController)
                                                                      leftViewController:ControllerForViewProxy(leftWindow)
                                                                     rightViewController:ControllerForViewProxy(rightWindow) ];
            } else {
                //left
                controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController)
                                                                      leftViewController:ControllerForViewProxy(leftWindow)];
            }
        } else if(rightWindow != nil){
            //right
            controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController)
                                                                 rightViewController:ControllerForViewProxy(rightWindow) ];
        } else {
            //error
            return nil;
            
        }
        */
        
        
        //controller.rightLedge = 100;
        
		/*
        UIView * controllerView = [controller view];
		
		[controllerView setFrame:[self bounds]];
		[self addSubview:controllerView];
        
        self.window.rootViewController = controller;
        
		[controller viewWillAppear:NO];
		[controller willAnimateRotationToInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation] duration:0.0];
		[controller viewDidAppear:NO];
         */
	}
	return controller;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
	[[[self controller] view] setFrame:bounds];
    [super frameSizeChanged:frame bounds:bounds];
}

@end
