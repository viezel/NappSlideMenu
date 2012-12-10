
var win = Ti.UI.createWindow({
	backgroundColor:'yellow'
});
var win2 = Ti.UI.createWindow({
	backgroundColor:'red'
});


var leftTableView = Ti.UI.createTableView({
	data:[],
	backgroundColor:"white"
});

var cenTableView = Ti.UI.createTableView({
	data:[],
	backgroundColor:"white"
});

var NappSlideMenu = require('dk.napp.slidemenu');
Ti.API.info("module is => " + NappSlideMenu);

var navController = Ti.UI.iPhone.createNavigationGroup({
	window : win
});
var newWin = Ti.UI.createWindow();
newWin.add(navController);
//newWin.open();

var window = NappSlideMenu.createSlideMenuWindow({
	centerWindow:win,
	leftWindow:win2,
	backgroundColor:"red"
	//rightWindow:
});
Ti.API.info("test: "+window);

window.add(
	Ti.UI.createView({
		height:20,
		width:20,
		backgroundColor:"blue"
	})
);

window.open();
