Introduction
-------------
This package includes all the files necessary for getting started with programming a Nymi Enabled Application for the Nymi Band. The most recent development kit can be downloaded from http://dev.nymi.com/

Prerequisites:
--------------
- Android Development:
	- Eclipse 
	- Android ADT x86 64
	- Device with Bluetooth 4.0 (if working with the Nymi Band)
	- Android SDK 19 and higher
	- The BasicExample app is set up to communicate with the Nymulator
	- To use the BasicExample app with a Nymi Band, the NCL library in Examples\BasicExample\libs must be replaces with the native library in NCL\native\libs
- Windows Development:
	- Visual Studio 2012 Professional or higher
	- BLED112 Dongle (if working with the Nymi Band)
- Mac Development:
	- OSX 10.9 and higher
	- XCode 6.0 and higher 
	- libNclNet.dylib and libNcl.dylib must be copied into /usr/local/lib/
- iOS
	- XCode 6.0 and higher 
	- iOS 8.1 and higher 

Package Contents:
-----------------
- Documentation: The SDK documentation for this particular version. The bleeding edge version can be downloaded from http://dev.nymi.com
- Examples: Specific example code that performs a specific use case 
- Nymi Communication Library: library and include files required for making a Nymi Enabled Application
- Nymulator: An application that simulates the behaviour of an Authenticated Nymi Band
- Nymi Bluetooth Service: *Windows Only* The service that is required for communicating with a physical Nymi Band 

Known Issues:
-------------
- Android SDK is currently compatible with:
	- Nexus 5, 7
	- Samsung Galaxy S4, S5
	- Samsung Galaxy note 3, 4
	- Galaxy Tab

Support:
--------
Please contact: info@nymi.com