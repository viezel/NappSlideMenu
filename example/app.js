

////////////////////////////////////////////////
//LEFT WINDOW
var winLeft = Ti.UI.createWindow();
var leftTableView = Ti.UI.createTableView({
	data:[{title:'Basic'},{title:'Basic2'}, {title:'Basic3'} ]
});
winLeft.add(leftTableView);
leftTableView.addEventListener("click", function(e){
	window.toggleLeftView();
	alert("You clicked " + e.rowData.title + ". Implement menu structure.. ");
})
////////////////////////////////////////////////


////////////////////////////////////////////////
// CENTER MAIN WINDOW
var winCenter = Ti.UI.createWindow({
	backgroundColor:'#eee',
	title:"Napp Slide Menu",
	barColor:"#000"
});
var leftBtn = Ti.UI.createButton({title:"Menu"});
leftBtn.addEventListener("click", function(){
	window.toggleLeftView();
});
var rightBtn = Ti.UI.createButton({title:"right"});
rightBtn.addEventListener("click", function(){
	window.toggleRightView();
});
winCenter.leftNavButton = leftBtn;
winCenter.rightNavButton = rightBtn;
////////////////////////////////////////////////


////////////////////////////////////////////////
// RIGHT WINDOW
var winRight = Ti.UI.createWindow({
	backgroundColor:'white'
});
////////////////////////////////////////////////




////////////////////////////////////////////////
// NappSlideMenu WINDOW
var NappSlideMenu = require('dk.napp.slidemenu');
var navController = Ti.UI.iPhone.createNavigationGroup({
	window : winCenter
});
var window = NappSlideMenu.createSlideMenuWindow({
	centerWindow:navController,
	leftWindow:winLeft,
	rightWindow:winRight,
	leftLedge:100
});
window.open(); //init the app
////////////////////////////////////////////////