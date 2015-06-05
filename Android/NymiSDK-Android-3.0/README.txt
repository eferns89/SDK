README Nymi SDK 3.0 Beta for Android
Last revised: May 28, 2015

--------
INTRODUCTION
--------
This revision of the Nymi SDK makes it much simpler to write apps for the Nymi Band. Android is the first platform for which this new API is being released. 

--------
SUPPORTED DEVICES
--------
Nexus 5
HTC One M8
Samsung Galaxy S4
Samsung Galaxy S5
Samsung Galaxy Note 3
Samsung Galaxy Note 4

--------
SUPPORTED ANDROID OPERATING SYSTEMS
--------
Lollipop (5.0)
Kitkat (4.4)

--------
SDK CONTENTS
--------
- nymi-api-nymulator.aar (Implementation of Nymi API)
- Nymulator (Nymi Band Simulator)
- Nymi API Javadoc
- Readme text file

SDK Documentation - https://www.nymi.com/dev/beta-documentation/
Android Reference Applications - https://github.com/NymiDev/Android/tree/master/NymiReferenceApp

--------
ADDITIONAL RESOURCES
--------
Developer Forum: http://forums.nymi.com/
Developer News: https://www.nymi.com/dev/
Download Nymi Apps: https://got.nymi.com/

--------
RELEASE NOTES
--------
* API is only supported for Nymulator at the moment. We will be releasing support for Nymi Band shortly. Frequent updates to the SDK should be expected as this is a Beta version.
* Only one NEA can run at a time and communicate with the Nymulator.
* Previous version of Nymulators is not supported. Version 1.2 and above is supported.

--------
KNOWN ISSUES
--------
Issue 1: The Nymulator may fail in a manner that is not reported but which causes NymiAdapter to fail to initialize.
* Workaround 1: Restart your Nymulator instance.
* Workaround 2: Physically restart your Nymulator host

Only in rare cases should Workaround 2 be required.

Issue 2: In OSX, when a new xml file is loaded into the Nymulator, the current list of Nymi Bands are not properly cleared in the gui.
* Workaround: We suggest to start a fresh Nymulator when loading a new xml file.

--------
FEEDBACK
--------
We’d love to hear about your experience. Please email us at feedback@nymi.com. 

--------
SUPPORT
--------
If you are experiencing technical difficulties please email info@nymi.com, and we will be happy to assist you. 




