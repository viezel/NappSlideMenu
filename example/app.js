////////////////////////////////////////////////
//LEFT WINDOW
var winLeft = Ti.UI.createWindow();
var leftTableView = Ti.UI.createTableView({
	font:{fontSize:12},
	rowHeight:40,
	data:[{title:'Basic'},{title:'Basic2'}, {title:'left to right'}, {title:'Change Center Windowr'}, {title:'Default Window'} ]
});
winLeft.add(leftTableView);
leftTableView.addEventListener("click", function(e){
	Ti.API.info("isAnyViewOpen: " + window.isAnyViewOpen());
	switch(e.index){
		case 0:
		case 1:
			window.toggleLeftView(); //animate back to center
			alert("You clicked " + e.rowData.title + ". Implement menu structure.. ");
			break;
		case 2:
			window.toggleOpenView();
			break;
		case 3:
			var newWin = Ti.UI.createWindow({backgroundColor:"red",title:"pushed window"});
			
			window.setCenterWindow(newWin);
			//window.toggleLeftView(); //animate back to center
			break;
		case 4:
			//default navcontroller
			window.setCenterWindow(navController);
			window.toggleLeftView(); //animate back to center
			break;
	}
});
////////////////////////////////////////////////


////////////////////////////////////////////////
// CENTER MAIN WINDOW
var navController = createCenterNavWindow();
////////////////////////////////////////////////

////////////////////////////////////////////////
// RIGHT WINDOW
var winRight = Ti.UI.createWindow({
	backgroundColor:'white'
});
////////////////////////////////////////////////


function createCenterNavWindow(){	
	var win = Ti.UI.createWindow({
		backgroundColor:'#eee',
		title:"Napp Slide Menu",
		barColor:"#000"
	});
	var leftBtn = Ti.UI.createButton({title:"Menu"});
	leftBtn.addEventListener("click", function(){
		window.toggleLeftView();
		window.setCenterhiddenInteractivity("TouchEnabled");
		
	});
	var rightBtn = Ti.UI.createButton({title:"right"});
	rightBtn.addEventListener("click", function(){
		window.toggleRightView();
		window.setCenterhiddenInteractivity("TouchEnabled");
	});
	win.leftNavButton = leftBtn;
	win.rightNavButton = rightBtn;
	
	// EXAMPLE API USAGE 
	var scrollView = Ti.UI.createScrollView({
		layout:"vertical",left:0,right:0,top:0,
	    contentHeight:'auto',contentWidth:"100%",
	    showVerticalScrollIndicator: true,showHorizontalScrollIndicator: false
	});
	var leftLedgeBtn = Ti.UI.createButton({title:"leftLedgeBtn: 100", toggled:true, top:10});
	leftLedgeBtn.addEventListener("click", function(e){
		if(e.source.toggled){
			var num = 250;
			window.setLeftLedge(num);
		} else {
			var num = 150;
			window.setLeftLedge(num);
		}
		leftLedgeBtn.setTitle("LeftLedgeBtn: " + num);
		e.source.toggled = !e.source.toggled;
		
	});
	scrollView.add(leftLedgeBtn);
	
	var panningMode = 1;
	var panningModeBtn = Ti.UI.createButton({title:"PanningMode: FullViewPanning", font:{fontSize:10}, width:300, top:10});
	panningModeBtn.addEventListener("click", function(e){
		if(panningMode == 2){
			panningMode = 0;
		} else {
			panningMode++;
		}
		switch(panningMode){
			case 0:
				window.setPanningMode("NoPanning");
				break;
			case 1:
				window.setPanningMode("FullViewPanning");
				break;
			case 2:
				window.setPanningMode("NavigationBarPanning");
				break;
		}
		panningModeBtn.setTitle("PanningMode: " + window.panningMode);
	});
	scrollView.add(panningModeBtn);
	
	var slider = Ti.UI.createSlider({
		top: 20,
	    min: 0,
	    max: 1,
	    width: 280,
	    value: 0.1
	});
	var label = Ti.UI.createLabel({
	    text: "Parallax: " + slider.value,
	    top: 15
    });
	slider.addEventListener('touchend', function(e) {
		label.setText("Parallax: " + e.value);
	    window.setParallaxAmount(e.value);
	});
	scrollView.add(label);
	scrollView.add(slider);	
	
	win.add(scrollView);
	
	//NAV
	var navController = Ti.UI.iPhone.createNavigationGroup({
		window : win
	});
	
	return navController;
}


////////////////////////////////////////////////
// NappSlideMenu WINDOW
var NappSlideMenu = require('dk.napp.slidemenu');

var window = NappSlideMenu.createSlideMenuWindow({
	centerWindow: navController,
	leftWindow:winLeft,
	rightWindow:winRight,
	leftLedge:150
});

window.addEventListener("viewWillOpen", function(e) {
	Ti.API.info(e);
});
window.addEventListener("viewWillClose", function(e) {
	Ti.API.info(e);
});

window.addEventListener("viewDidOpen", function(e) {
	Ti.API.info(e);
});
window.addEventListener("viewDidClose", function(e) {
	Ti.API.info(e);
});

window.addEventListener("didChangeOffset", function(e) {
	//Ti.API.info(e);
});
window.addEventListener("centerViewDidShow", function(e) {
	Ti.API.info(e);
});

window.open(); //init the app



////////////////////////////////////////////////