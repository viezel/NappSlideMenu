/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiRootViewController+Extended.h"
#import "JRSwizzle.h"


@implementation TiRootViewController (Extended)

/*
 Extending Titanium UI through the method swizzling technique:
 http://www.cocoadev.com/index.pl?MethodSwizzling
 https://github.com/rentzsch/jrswizzle
 */

/*
+(void)load
{
    NSError *error = nil;
    NSError *error2 = nil;
    
    [TiRootViewController jr_swizzleMethod:@selector(willRotateToInterfaceOrientation) withMethod:@selector(willRotateToInterfaceOrientationExtended) error:&error];
    if (error != nil) {
        NSLog(@"[ERROR] %@", [error localizedDescription]);
    }
    
    [TiRootViewController jr_swizzleMethod:@selector(didRotateFromInterfaceOrientation) withMethod:@selector(didRotateFromInterfaceOrientationExtended) error:&error2];
    if (error2 != nil) {
        NSLog(@"[ERROR] %@", [error2 localizedDescription]);
    }
}

- (void)willRotateToInterfaceOrientationExtended:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
{
    windowOrientation = toInterfaceOrientation;
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    for (TiWindowProxy * thisProxy in windowProxies)
    {
        UIViewController * thisNavCon = [thisProxy navController];
        if (thisNavCon == nil)
        {
            thisNavCon = [thisProxy controller];
        }
        [thisNavCon willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    }
}

- (void)didRotateFromInterfaceOrientationExtended:(UIInterfaceOrientation)fromInterfaceOrientation;
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    for (TiWindowProxy * thisProxy in windowProxies)
    {
        UIViewController * thisNavCon = [thisProxy navController];
        if (thisNavCon == nil)
        {
            thisNavCon = [thisProxy controller];
        }
        [thisNavCon didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    }
}
*/

@end
