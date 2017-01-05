# iCloudStuff
An Objective-C module for Titanium. Lets you use the iCloud keychain. This is an implementation of the excellent tutorial found here: http://www.lighthouselogic.com/icloud-in-titanium/ with the addition of the ```is_icloud_enabled``` method.

Usage:
```
var iCloudStuff = require("com.restado.iCloudStuff");		

var icloud_enabled = iCloudStuff.is_icloud_enabled();

if (icloud_enabled) {
 
    iCloudStuff.setString({
    
		    key: "datum",
		    value: "The iCloud Keychain is the greatest!"
		});
    
    setTimeout(function() {
    
        alert(iCloudStuff.getString({key: "datum"})); //"The iCloud Keychain is the greatest!"
    }, 0);
}
```
