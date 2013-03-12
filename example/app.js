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
			window.toggleLeftView(); //animate back to center
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
		window.setCenterhiddenInteractivity("TouchDisabledWithTapToCloseBouncing");
		window.setPanningMode("NavigationBarPanning");
	});
	var rightBtn = Ti.UI.createButton({title:"right"});
	rightBtn.addEventListener("click", function(){
		window.toggleRightView();
		window.setCenterhiddenInteractivity("TouchEnabled");
		window.setPanningMode("NoPanning");
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
			var num = 100;
			window.setLeftLedge(num);
		}
		leftLedgeBtn.setTitle("LeftLedgeBtn: " + num);
		e.source.toggled = !e.source.toggled;
		
	});
	scrollView.add(leftLedgeBtn);
	
	var slider = Ti.UI.createSlider({
		top: 20,
	    min: 0,
	    max: 1,
	    width: 280,
	    value: 0
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
	centerWindow:navController,
	leftWindow:winLeft,
	rightWindow:winRight,
	leftLedge:100
});

window.open(); //init the app
////////////////////////////////////////////////