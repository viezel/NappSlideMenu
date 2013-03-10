# NappSlideMenu Module

## Description

The NappSlideMenu module extends the Appcelerator Titanium Mobile framework. 
The module is licensed under the MIT license.

Thanks to `Tom Adriaenssen` for his great work with ViewDeck https://github.com/Inferis/ViewDeck


![NappSlideMenu](https://raw.github.com/viezel/NappSlideMenu/master/documentation/slidemenu.png) 
![NappSlideMenu-left](https://raw.github.com/viezel/NappSlideMenu/master/documentation/slidemenu-left.png)

## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:
    
    <modules>
        <module platform="iphone">dk.napp.slidemenu</module> 
    </modules>

**Find the newest version in the dist folder**

## Reference

For more detailed code examples take a look into the example app

### centerWindow, leftWindow, rightWindow

NappSlideMenu does not require you to use the 3 windows. You can also use either the combo of center/left or center/right for your desired needs. 

### leftLedge, rightLedge (optinal)

Ledge is used to define the maximum amount the view can be opened. Default is `65` if no number is defined. 

	var window = NappSlideMenu.createSlideMenuWindow({
		centerWindow:navController,
		leftWindow:winLeft,
		rightWindow:winRight,
		leftLedge:100
	});
	

## API Properties
	
### setCenterWindow, setLeftWindow, setRightWindow

A method that allow change of the centerWindow. You can either use a window or a navigation group. 
	
	var newWin = Ti.UI.createWindow({
		backgroundColor: "#FF0000"
	};
	mainWindow.setCenterWindow(newWin);	

### setLeftLedge, setRightLedge

Update the ledge numbers with these methods. 

	mainWindow.setLeftLedge(120);


## API Methods

### toggleLeftView, toggleRightView

`toggleLeftView()` and `toggleRightView()` are used to toggle each visibility of either the left or right window. 

### toggleOpenView

`toggleOpenView()` toggles the open window. A method to come from LeftWindow to RightWindow or opposite. 

	mainWindow.toggleOpenView();

### bounceLeftView, bounceRightView, bounceTopView, bounceBottomView

A small animation to show the app user that its possible to interact with the NappSlideMenu.

	mainWindow.bounceLeftView();

### setParallaxAmount

Parallax is the ammount of parallax between the centerWindow and a sideWindow. Set a value between 0 and 1. 

	mainWindow.setParallaxAmount(0.3);


## Changelog

**v1.0**  
Updated ViewDeck to newest version (2.2.4).  
Added setParallaxAmount().  
Added setLeftWindow() and setRightLedge() setters  
Added setLeftLedge() and setRightLedge() setters  
Better example code

**v0.6**  
Added setCenterWindow(). Thanks to @rafaelks

**v0.5**  
Working module. 

**v0.4**  
Semi working. 

## Author

**Mads Møller**  
web: http://www.napp.dk  
email: mm@napp.dk  
twitter: @nappdev  


## License

    Copyright (c) 2010-2013 Mads Møller

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
