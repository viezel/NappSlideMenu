# NappSlideMenu Module

## Description

The NappSlideMenu module extends the Appcelerator Titanium Mobile framework. 
The module is licensed under the MIT license.

Thanks to `Tom Adriaenssen` for his great work with ViewDeck https://github.com/Inferis/ViewDeck


![NappSlideMenu](https://raw.github.com/viezel/NappSlideMenu/master/readme/slidemenu.png) 
![NappSlideMenuleft](https://raw.github.com/viezel/NappSlideMenu/master/readme/slidemenuleft.png)

### Get the module

**Find the newest version in the dist folder**

## Referencing the module in your Titanium Mobile application 

Simply add the following lines to your `tiapp.xml` file:
    
    <modules>
        <module platform="iphone">dk.napp.slidemenu</module> 
    </modules>


## Reference

For more detailed code examples take a look into the example app

### centerWindow, leftWindow, rightWindow

NappSlideMenu does not require you to use the 3 windows. You can also use either the combo of center/left or center/right for your desired needs. 

### leftLedge, rightLedge (optinal)

Ledge is used to define the maximum amount the view can be opened. Default is `65` if no number is defined. 
```javascript
var mainWindow = NappSlideMenu.createSlideMenuWindow({
	centerWindow:navController,
	leftWindow:winLeft,
	rightWindow:winRight,
	leftLedge:100
});
```	

## API Properties
	
### setCenterWindow, setLeftWindow, setRightWindow

A method that allow change of the centerWindow. You can either use a window or a navigation group. 
```javascript	
var newWin = Ti.UI.createWindow({
	backgroundColor: "#FF0000"
};
mainWindow.setCenterWindow(newWin);	
```

### setLeftLedge, setRightLedge

Update the ledge numbers with these methods. 
```javascript
mainWindow.setLeftLedge(120);
```

### setCenterhiddenInteractivity

Set different types of interactivity for the centerWindow when either leftWindow or rightWindow is open. 
```javascript
mainWindow.setCenterhiddenInteractivity("TouchEnabled");
```

| input (string) | Description | 
| ----- | ----------- |
| TouchEnabled | the centerWindow stays interactive | 
| TouchDisabled | the centerWindow will become nonresponsive to useractions | 
| TouchDisabledWithTapToClose | the centerWindow will become nonresponsive to useractions, but will allow the user to tap it so that it closes | 
| TouchDisabledWithTapToCloseBouncing | same as TouchDisabledWithTapToClose, but closes the center view bouncing | 

### setPanningMode

Set the panning mode (drag animation).

```javascript
mainWindow.setPanningMode("NoPanning");
```

| input (string) | Description | 
| ----- | ----------- |
| NoPanning | No panning allowed | 
| FullViewPanning | Default behavior: Touch anywhere in the center view to drag the center view around | 
| NavigationBarPanning | Panning only occurs when you start touching in the navigation bar (when the center controller is a UINavigationController with a visible navigation bar). Otherwise it will behave as IIViewDeckNoPanning. | 
| NavigationBarOrOpenCenterPanning | Panning occurs when you start touching the navigation bar if the centerWindow is visible.  If the left or right controller is open, pannning occurs anywhere on the center controller, not just the navbar. | 

### setParallaxAmount

Parallax is the amount of parallax between the centerWindow and a sideWindow animation. Set a value between 0 and 1. 
Its a very cool effect. Play with the slider in the example code to see the effect!

```javascript
mainWindow.setParallaxAmount(0.3);
```

### setOpenViewAnimationDuration

Set the duration of the animation when leftWindow or rightWindow is opened. It takes a float as argument

```javascript
mainWindow.setOpenViewAnimationDuration(0.3);
```

### setCloseViewAnimationDuration

Set the duration of the animation when leftWindow or rightWindow is closed. It takes a float as argument

```javascript
mainWindow.setCloseViewAnimationDuration(0.3);
```


## API Methods

### toggleLeftView, toggleRightView

`toggleLeftView()` and `toggleRightView()` are used to toggle each visibility of either the left or right window. 

### toggleOpenView

`toggleOpenView()` toggles the open window. A method to come from LeftWindow to RightWindow or opposite. 

	mainWindow.toggleOpenView();

### bounceLeftView, bounceRightView, bounceTopView, bounceBottomView

A small animation to show the app user that its possible to interact with the NappSlideMenu.

	mainWindow.bounceLeftView();


### isAnyViewOpen

Check if any of the windows is open. This returns a boolean. 

```javascript
mainWindow.isAnyViewOpen();
```

## Events

### viewWillOpen

When leftWindow or rightWindow will be opened, this event is fired with the *view* event parameter.

Here, you can block centerWindow, for example.

```javascript
mainWindow.addEventListener("viewWillOpen", function(e) {
	this.setCenterhiddenInteractivity("TouchDisabledWithTapToClose");
});
```

### viewDidOpen
When the leftWindow or rightWindow did open. The animation has completed. 


### viewWillClose

When the leftWindow or rightWindow will be closed, this event is fired with the *view* event parameter.

Here, you can blur a searchBar in leftWindow, for example.
```javascript
mainWindow.addEventListener("viewWillClose", function(e) {
	this.setCenterhiddenInteractivity("TouchEnabled");
});
```

### viewDidClose
When the leftWindow or rightWindow did open. The animation has completed. 


### didChangeOffset
Change of offset.


### centerViewDidShow
When an animation from the one of the side windows to the CenterWindow completes.


## Alloy example

### Controller (index.js)
```javascript
var NappSlideMenu = require('dk.napp.slidemenu');

var window = NappSlideMenu.createSlideMenuWindow({
	centerWindow:$.navgroup,
	leftWindow:$.leftWindow,
	rightWindow:$.rightWindow,
	leftLedge:80
});

$.leftTable.addEventListener("click", function(e){
	// implement logic
});

function openLeft(){
	window.toggleLeftView();
}
function openRight(){
	window.toggleRightView();
}

window.open(); //open the app
```

### View (index.xml)
```xml
<Alloy>
    <Window id="leftWindow">
        <TableView id="leftTable">
            <TableViewRow>
                <Label text="hello left window"></Label>
            </TableViewRow>
        </TableView>
    </Window>
    
    <NavigationGroup id="navgroup">
     	<Window id="win">
			<LeftNavButton>
				<Button title="Left" onClick="openLeft"></Button>
			</LeftNavButton>
			<RightNavButton>
				<Button title="Right" onClick="openRight"></Button>
			</RightNavButton>
     	    <TableView >
	            <TableViewRow>
	                <Label text="hello center window"></Label>
	            </TableViewRow>
        	</TableView>
     	</Window>   
    </NavigationGroup>
    
    <Window id="rightWindow">
        <TableView id="rightTable">
            <TableViewRow>
                <Label text="hello right window"></Label>
            </TableViewRow>
        </TableView>
    </Window>
</Alloy>
```

## Changelog

**v1.4.0** 

* iOS7 support
* Titanium minimum SDK changed to 3.1.3.GA
* iOS min-sdk is now 5.0 
* Known issue:
  * Translucent navigationBar contains a visual bug. You should disable it.

**v1.3.2**  

* Minor bugfix in centerWindow if use nav controller.
* Downgraded to ViewDeck 2.2.11. Thanks to @mantonaci


**v1.3.1**  

* Fix memory leak in ViewDeck when closing the NappSlideMenu. Thanks to @Michele 

**v1.3**  

* Major bugfix/improvement: NavigationBarPanning is fully working now. You gain deeper control over which elements should react to the swipe gesture.  
* Updated ViewDeck to newest version (2.3.1).  
* Added setOpenViewAnimationDuration() and setCloseViewAnimationDuration().  
* Added isAnyViewOpen().  

**v1.2.1**  

* Updated ViewDeck to newest version (2.2.8).  
* Added event: viewDidOpen, viewDidClose, didChangeOffset and centerViewDidShow.   

**v1.2**  

* Added viewWillClose and viewWillOpen eventlisteners.   

**v1.1**  

* Added setCenterhiddenInteractivity().  
* Added setPanningMode().  


**v1.0**  

* Updated ViewDeck to newest version (2.2.4).  
* Added setParallaxAmount().  
* Added setLeftWindow() and setRightLedge() setters  
* Added setLeftLedge() and setRightLedge() setters  
* Better example code

**v0.6**  

* Added setCenterWindow(). Thanks to @rafaelks

**v0.5**  

* Working module. 

**v0.4**  

* Semi working. 

## Author

**Mads Møller**  
web: http://www.napp.dk  
email: mm@napp.dk  
twitter: @nappdev  

## Contributors

**Rafael K. Streit**  
twitter: @rafaelks

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
