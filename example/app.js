var flf = require('ts.floatlabelfield');

// open a single window
var win = Ti.UI.createWindow({
    backgroundColor:'white',
    layout: 'vertical'
});

var floatlabelfield = flf.createTextFieldView({
    height: Ti.UI.SIZE,
    width: Ti.UI.SIZE,
    top: 150,
    fontSize: '18dp',
    textColor: '#2c3e50',
    placeholderTextColor: '#8d8d8d',
    placeholderText: "short description",
    floatingLabelFontSize: '12dp',
    floatingLabelTextColor: "#2980b9",
    debug: false
});
win.add(floatlabelfield);

var floatlabelview = flf.createTextViewView({
    height: 150,
    width: 150,
    top: 50,
    fontSize: '10dp',
    textColor: '#2c3e50',
    placeholderTextColor: '#bdc3c7',
    placeholderText: "short description",
    floatingLabelFontSize: '7dp',
    floatingLabelTextColor: "#2980b9",
    debug: false
});
win.add(floatlabelview);
win.open();
