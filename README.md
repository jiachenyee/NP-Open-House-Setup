# Friction Setup

## Setup Instructions
### Friction setup
1. Start up the iMac
2. Give it a couple of minutes and everything should automatically start and open up

### When someone wants to see it
1. Launch Friction on the iPad
2. Grab the USB to lighting cable (in the iPad box) and connect it to the iMac
3. Connect the iPad to the Mac and give it a couple of seconds
4. You should see the Mac's screen on the iPad
5. You can now demo friction by dragging your finger on the screen to draw, you can switch to the other tab automatically open in Safari (CodeCollab) and show how it can be used to annotate on a code editor or something..
6. You can also demo the black/white board.. on the iPad, tap on View, then tap on Blackboard or Whiteboard. To get rid of it, just tap on the Clear Background option (or just unplug the iPad from the Mac)

### Explaining Source Code
1. Press Command+Tab until you reach the Xcode icon
2. Explaining how it's built
  - Friction is built in 3 parts, the Mac app, iPad app and sending data over the USB connection these can be seen in Xcode with the folders `Friction Mac`, `Friction` and `Peertalk` respectively. 
  - The "Shared" folder consists of the files that are shared between the Mac and iPad clients. 
    - `ScreenRecordingData.swift` sends data from the Mac to the iPad
    - `DrawingData.swift` sends data from the iPad to the Mac
  - The iPad and Mac apps are built with Swift while the communication betweent the two over a USB cable is in Objective-C
