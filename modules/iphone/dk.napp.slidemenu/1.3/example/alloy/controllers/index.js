var NappSlideMenu = require('dk.napp.slidemenu');

var window = NappSlideMenu.createSlideMenuWindow({
	centerWindow:$.navgroup,
	leftWindow:$.leftWindow,
	rightWindow:$.rightWindow,
	leftLedge:80,
	parallaxAmount:0.2
});

window.addEventListener("viewWillOpen", function(e) {
	Ti.API.info(e.view + "Window will open");
});

window.addEventListener("viewWillClose", function(e) {
	Ti.API.info(e.view + "Window will close");
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