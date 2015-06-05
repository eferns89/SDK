This project is designed for the iPhone 6 simulator only!

This package provides an Xcode project that implements basic use of NCL, allowing you to walk through the 2 different scenarios in which a Nymi is used by an NEA. First it walks through the provision steps and then on subsequently can repeatedly walk through validate steps.
The file structure of the project is like so:
	libNCLNetiOS.a - the compiled NCL
	ncl.h - the NCL header
	
	ViewController.h and .m
	  -view controller that interacts with NCL
	NclWrapper.h and .m 
	  - wraps the core NCL functions for easier consumption by Objective-C
NOTES:
	The example is setup to use the Nymi emulator (Nymulator). In order to test with a physical Nymi band, you have to change the implementation of setNclDelegate method in NclWrapper.m (comments in the implementation document lines that have to be changed). In addition to this, you will have to use libNCLiOS.a instead of libNCLNetiOS.a
You will also have to add CoreBluetooth.framework to your project. 
