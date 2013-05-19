/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiBase.h"
#import "DkNappSlidemenuSlideMenuWindow.h"
#import "DkNappSlidemenuSlideMenuWindowProxy.h"
#import "TiUtils.h"
#import "TiViewController.h"

UIViewController * ControllerForViewProxy(TiViewProxy * proxy);

UIViewController * ControllerForViewProxy(TiViewProxy * proxy)
{
    [[proxy view] setAutoresizingMask:UIViewAutoresizingNone];
    
    //make the proper resize !
    TiThreadPerformOnMainThread(^{
        [proxy windowWillOpen];
        [proxy reposition];
        [proxy windowDidOpen];
    },YES);
    return [[[TiViewController alloc] initWithViewProxy:(TiViewProxy<TiUIViewController>*)proxy] autorelease];
}


@implementation DkNappSlidemenuSlideMenuWindow


-(void)dealloc
{
	RELEASE_TO_NIL(controller);
	[super dealloc];
}

-(IIViewDeckController*)controller
{
	if (controller==nil)
	{
        TiViewProxy* centerController = [self.proxy valueForUndefinedKey:@"centerWindow"];
		TiViewProxy* leftWindow = [self.proxy valueForUndefinedKey:@"leftWindow"];
        TiViewProxy* rightWindow = [self.proxy valueForUndefinedKey:@"rightWindow"];
        
        float rightLedge = [TiUtils floatValue:[self.proxy valueForUndefinedKey:@"rightLedge"] def:65];
        float leftLedge = [TiUtils floatValue:[self.proxy valueForUndefinedKey:@"leftLedge"] def:65];

        if(leftWindow != nil){
            if(rightWindow != nil){
                //both left and right
                controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController)
                                                                      leftViewController:ControllerForViewProxy(leftWindow)
                                                                     rightViewController:ControllerForViewProxy(rightWindow) ];    
            } else {
                //left only
                controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController)
                                                                      leftViewController:ControllerForViewProxy(leftWindow)];
            }
        } else if(rightWindow != nil){
            //right only
            controller =  [[IIViewDeckController alloc] initWithCenterViewController:ControllerForViewProxy(centerController)
                                                                 rightViewController:ControllerForViewProxy(rightWindow) ];
        } else {
            //error
            NSLog(@"NappSlideMenu ERROR: No windows assigned");
            return nil;
        }
        
        //setting the ledge
        [controller setLeftSize:leftLedge];
        [controller setRightSize:rightLedge];

        [controller setDelegate:(DkNappSlidemenuSlideMenuWindowProxy *)[self proxy]];
        
        UIView * controllerView = [controller view];
        [controllerView setFrame:[self bounds]];
        [self addSubview:controllerView];
        
        [controller viewWillAppear:NO];
        [controller viewDidAppear:NO];
	}
	return controller;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
	[[[self controller] view] setFrame:bounds];
    [super frameSizeChanged:frame bounds:bounds];
}


////////////////////////////////////////
// Methods
////////////////////////////////////////
-(void)toggleLeftView:(id)args
{
    ENSURE_UI_THREAD(toggleLeftView,args);
    [controller toggleLeftView];
}
-(void)toggleRightView:(id)args
{
    ENSURE_UI_THREAD(toggleRightView,args);
    [controller toggleRightView];
}
-(void)bounceLeftView:(id)args
{
    ENSURE_UI_THREAD(bounceLeftView,args);
    [controller previewBounceView:IIViewDeckLeftSide];
}
-(void)bounceRightView:(id)args
{
    ENSURE_UI_THREAD(bounceRightView,args);
    [controller previewBounceView:IIViewDeckRightSide];
}
-(void)bounceTopView:(id)args
{
    ENSURE_UI_THREAD(bounceTopView,args);
    [controller previewBounceView:IIViewDeckTopSide];
}
-(void)bounceBottomView:(id)args
{
    ENSURE_UI_THREAD(bounceBottomView,args);
    [controller previewBounceView:IIViewDeckBottomSide];
}
-(void)toggleOpenView:(id)args
{
    ENSURE_UI_THREAD(toggleOpenView,args);
    [controller toggleOpenView];
}

-(NSNumber*)isAnyViewOpen:(id)args
{
    return [controller isAnySideOpen] ? NUMBOOL(YES) : NUMBOOL(NO);
}


/* - NOT WORKING
-(NSNumber *)canRightViewPushViewControllerOverCenterController:(id)args
{
    NSString *className = NSStringFromClass([controller.centerController class]);
    NSLog(@"%@", className );
    return [controller.centerController isKindOfClass:[UINavigationController class]] ? NUMBOOL(YES) : NUMBOOL(NO);
}

-(void)rightViewPushViewControllerOverCenterController:(id)args
{
    ENSURE_UI_THREAD(rightViewPushViewControllerOverCenterController, args);
	ENSURE_SINGLE_ARG(args, TiViewProxy);
    [controller rightViewPushViewControllerOverCenterController:ControllerForViewProxy(args)];
}
*/

////////////////////////////////////////
// Properties
////////////////////////////////////////
- (void)setPanningMode_:(id)args
{
    ENSURE_UI_THREAD(setPanningMode_,args);
    ENSURE_SINGLE_ARG(args, NSString);
    NSString *string = [TiUtils stringValue:args];
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithInteger:0],@"NoPanning",
                             [NSNumber numberWithInteger:1],@"FullViewPanning",
                             [NSNumber numberWithInteger:2],@"NavigationBarPanning",
                             [NSNumber numberWithInteger:3],@"PanningViewPanning",
                             [NSNumber numberWithInteger:4],@"DelegatePanning",
                             [NSNumber numberWithInteger:5],@"NavigationBarOrOpenCenterPanning",
                             nil];
    //NSLog(@"NAPP SLIDE MENU setPanningMode %i", [[mapping  objectForKey:string] intValue]);
    [controller setPanningMode:[[mapping  objectForKey:string] intValue]];

    /*
    NSLog(@"IIViewDeckNoPanning %i", IIViewDeckNoPanning);
    NSLog(@"IIViewDeckFullViewPanning %i", IIViewDeckFullViewPanning);
    NSLog(@"IIViewDeckNavigationBarPanning %i", IIViewDeckNavigationBarPanning);
    NSLog(@"IIViewDeckPanningViewPanning %i", IIViewDeckPanningViewPanning);
    NSLog(@"IIViewDeckDelegatePanning %i", IIViewDeckDelegatePanning);
    NSLog(@"IIViewDeckNavigationBarOrOpenCenterPanning %i", IIViewDeckNavigationBarOrOpenCenterPanning);*/

}

-(void)setCenterhiddenInteractivity_:(id)args
{
    ENSURE_UI_THREAD(setCenterhiddenInteractivity_, args);
    ENSURE_SINGLE_ARG(args, NSString);
    NSString *string = [TiUtils stringValue:args];
    NSDictionary *mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithInteger:0],@"TouchEnabled",
                             [NSNumber numberWithInteger:1],@"TouchDisabled",
                             [NSNumber numberWithInteger:2],@"TouchDisabledWithTapToClose",
                             [NSNumber numberWithInteger:3],@"TouchDisabledWithTapToCloseBouncing",
                            nil];
    [controller setCenterhiddenInteractivity:[[mapping  objectForKey:string] intValue]];
}

-(void)setCenterWindow_:(id)args
{
	ENSURE_UI_THREAD(setCenterWindow_, args);
	ENSURE_SINGLE_ARG(args, TiViewProxy);
	[controller setCenterController: ControllerForViewProxy(args)];
}

-(void)setLeftWindow_:(id)args
{
	ENSURE_UI_THREAD(setLeftWindow_, args);
	ENSURE_SINGLE_ARG(args, TiViewProxy);
	[controller setLeftController:ControllerForViewProxy(args)];
}

-(void)setRightWindow_:(id)args
{
	ENSURE_UI_THREAD(setRightWindow_, args);
	ENSURE_SINGLE_ARG(args, TiViewProxy);
	[controller setRightController:ControllerForViewProxy(args)];
}

-(void)setLeftLedge_:(id)args
{
	ENSURE_UI_THREAD(setLeftLedge_, args);
	ENSURE_SINGLE_ARG(args, NSNumber);
	[controller setLeftSize:[TiUtils floatValue:args]];
}

-(void)setRightLedge_:(id)args
{
	ENSURE_UI_THREAD(setRightLedge_, args);
	ENSURE_SINGLE_ARG(args, NSNumber);
	[controller setRightSize:[TiUtils floatValue:args]];
}

-(void)setParallaxAmount_:(id)args
{
    ENSURE_UI_THREAD(setParallaxAmount_, args);
	ENSURE_SINGLE_ARG(args, NSNumber);
    [controller setParallaxAmount:[TiUtils floatValue:args]];
}

-(void)setOpenViewAnimationDuration_:(id)args
{
    ENSURE_UI_THREAD(setOpenViewAnimationDuration_, args);
	ENSURE_SINGLE_ARG(args, NSNumber);
    [controller setOpenSlideAnimationDuration:[TiUtils floatValue:args]];
}

-(void)setCloseViewAnimationDuration_:(id)args
{
    ENSURE_UI_THREAD(setCloseViewAnimationDuration_, args);
	ENSURE_SINGLE_ARG(args, NSNumber);
    [controller setCloseSlideAnimationDuration:[TiUtils floatValue:args]];
}




@end
