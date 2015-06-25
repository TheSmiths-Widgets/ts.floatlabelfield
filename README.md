
# Float label field [![Titanium](http://www-static.appcelerator.com/badges/titanium-git-badge-sq.png)](http://www.appcelerator.com/titanium/) [![Alloy](http://www-static.appcelerator.com/badges/alloy-git-badge-sq.png)](http://www.appcelerator.com/alloy/)

This module for [Appcelerator](http://www.appcelerator.com) Titanium wraps [https://github.com/jverdi/JVFloatLabeledTextField](JVFloatLabeledTextField) for **iOS** (TODO: Android).

## Preview
Credits for the concept to Matt D. Smith ([@mds](http://www.twitter.com/mds)), and his [original design](http://dribbble.com/shots/1254439--GIF-Mobile-Form-Interaction?list=users):

![Matt D. Smith's Design](http://dribbble.s3.amazonaws.com/users/6410/screenshots/1254439/form-animation-_gif_.gif)

Credits for the iOS implementation to [https://github.com/jverdi](Jverdi).

## Quick Start

### Get it [![gitTio](http://gitt.io/badge.png)](http://gitt.io/component/[YOUR PROJECT ID])
Download this repository or one release and install it:

* In your application's tiapp.xml file, include the following line in your `<modules>` tag:

```xml
<module platform="ios">ts.floatlabelfield</module>
```

*  Copy the module zip file into your application root directory.


### Use it

* Require the module in a view:

**file1.xml**
```xml
<Module module="ts.floatlabelfield" id="floatField" />
```
Which create a reference in your controller, accessible via: `$.floadField`

* Or, require it directly in a controller :

```javascript
var floatlabelfield = require('ts.floatlabelfield').createView({ _[PARAMS]_ );
```

**Example:**
```
var win = Ti.UI.createWindow({ backgroundColor:'#fff' });
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
```


## Documentation
### Properties
You can pass properties during initialization or later:  

| Parameter     | Type      | Description               |
| ------------- | --------- | ------------------------- |
| fontSize 				 | int    | Size of all texts inside field |
| textColor 			 | String | Color of written text inside field |
| placeholderTextColor   | String | Color of placeholder text inside field |
| placeholderText 		 | String | Placeholder text value |
| floatingLabelFontSize  | int    | Size of the floating label above field |
| floatingLabelTextColor | String | Color of the floating label above field |


## Public methods
Here is a list of all accessible methods and the associated expected behaviour:

| Method         | Description               |
| -------------  | ------------------------- |
| setFontSize 			 	| Set fontSize property 	  	      |
| setTextColor 			 	| Set textColor property 		 	  |
| setPlaceholderTextColor   | Set placeholderTextColor property   |
| setPlaceholderText 		| Set placeholderText property 		  |
| setFloatingLabelFontSize  | Set floatingLabelFontSize property  |
| setFloatingLabelTextColor | Set floatingLabelTextColor property |

| Method         | Description               |
| -------------  | ------------------------- |
| getValue 		 | Returns field's value	 |

## Events
You can listen for events by simply adding an event listener:

* In an Alloy view:
```xml
<Module module="ts.floatlabelfield" id="floatField" onChange="onFieldChange" />
```

* In an Alloy controller:
```javascript
$.floatField.addEventListener("change", onFieldChange);
```

You can now bind the change listener in your controller:

```javascript
function onFieldChange(e) {
    Ti.API.info('Field value changed for ' + e.value);
}
```

### Supported events
Here is a list of all supported events and the associated expected behaviour:

| Event         | Description               |
| ------------- | ------------------------- |
| change 		| Triggers when user changes field's value. Contains `value`. |


## Customization
* How to apply custom styles to the project?
* What kind of custom models are supported (provide structure)?
* Which public properties can be accessed (provide list)?

******************************************

## TODO / Ideas for improvement
Feel free to improve this widget by forking, submitting pull requests or creating issues.  
Here are my ideas:

* Add support for JVFloatLabeledTextView
* Wrap an Android implementation

## Changelog
* 1.0 First version

## Dependencies
* [https://github.com/jverdi/JVFloatLabeledTextField](JVFloatLabeledTextField)

## Licences
JVFloatLabeledTextField is licensed under the [MIT license](https://github.com/jverdi/JVFloatLabeledTextField/blob/master/LICENSE).

Appcelerator, Appcelerator Titanium and associated marks and logos are trademarks of Appcelerator, Inc.  
Titanium is Copyright (c) 2008-2015 by Appcelerator, Inc. All Rights Reserved.  
Titanium is licensed under the Apache Public License (Version 2).  