
var winCenter = Ti.UI.createWindow({
	backgroundColor:'yellow',
	barColor:"#000"
});

//LEFT
var winLeft = Ti.UI.createWindow({
	backgroundColor:'red'
});
var leftView = Ti.UI.createView({
	width: 320,
	height:480,
	backgroundColor:"blue"
});
var leftTableView = Ti.UI.createTableView({
	data:[{title:'Basic'},{title:'Basic2'}, {title:'Basic3'} ],
	backgroundColor: 'transparent',
	rowHeight: 44,
	width: 320, 
	left:0,
	allowsSelection: true
});
leftView.add(leftTableView);
winLeft.add(leftView);



/// RIGHT
var winRight = Ti.UI.createWindow({
	backgroundColor:'white'
});

//nav buttons
var leftBtn = Ti.UI.createButton({title:"left"});
leftBtn.addEventListener("click", function(){
	window.toggleLeftView();
});

var rightBtn = Ti.UI.createButton({title:"right"});
rightBtn.addEventListener("click", function(){
	window.toggleRightView();
});

winCenter.leftNavButton = leftBtn;
winCenter.rightNavButton = rightBtn;



var NappSlideMenu = require('dk.napp.slidemenu');
Ti.API.info("module is => " + NappSlideMenu);

var navController = Ti.UI.iPhone.createNavigationGroup({
	window : winCenter
});




var window = NappSlideMenu.createSlideMenuWindow({
	centerWindow:navController,
	leftWindow:winLeft,
	rightWindow:winRight,
	leftLedge:100
});
window.open();

/*
setTimeout(function(){
	//window.toggleLeftView();
},1500);

setTimeout(function(){
	//window.bounceLeftView();
	var newWin = Ti.UI.createWindow({backgroundColor:"blue"});
	navController.open(newWin);
},3500);
*/