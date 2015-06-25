
// open a single window
var win = Ti.UI.createWindow({
    backgroundColor:'white'
});
var floatlabelfield = require('ts.floatlabelfield').createView({
    height: Ti.UI.SIZE,
    width: Ti.UI.SIZE,
    fontSize: '18dp',
    textColor: '#2c3e50',
    placeholderTextColor: '#bdc3c7',
    placeholderText: "short description",
    floatingLabelFontSize: '20dp',
    floatingLabelTextColor: "#2980b9"
});
win.add(floatlabelfield);
win.open();
