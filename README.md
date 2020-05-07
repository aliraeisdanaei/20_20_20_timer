# 20Timer

## Introduction
This program was designed to remind microsoft users to take a break from looking at the screen. 
It reminds the user by sounding a ringtone, talking to the user, and or by openning a popup. 

## Different Screens
### Main Menu
:[Main Menu Screen](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/images/main_menu.JPG)

### Initial Set Up
Initially when the settings.txt file is empty this screen will show. 
:[Initial Set Up Screen](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/images/initSetup.JPG)

It will prompt the user for information, and preferences for notifications. 
It will save the information onto data.txt, and retrieve it everytime the program is run again. 

### Timer Screen
The timer screen is green when it is in work mode. The seconds are decremented by fives. 
:[Work Screen](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/images/work%20screen.jpg)

And it is red when it is in break mode. The seconds are decremented by one. 
:[Break Screen](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/images/break.JPG)

Once the work timer reaches zero, the ringtone, speech, and popups will be triggered if they were enabled. 
:[Pop Up Image](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/media/break-time.jpg)


The ringtone and speech will be sounded again when the break time is over to signal the user to go back to work. 


### Setting
All of the preferences can be changed in the app. 
:[Settings Screen](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/images/settings.JPG)

#### Ringtone SetUp 
The ringtones can be changed from a menu. Each of them can also be heard. 
:[Ringtone Screen ](https://raw.githubusercontent.com/aliraeisdanaei/20_20_20_timer/master/images/RingtoneSetUp.JPG)


## Notes
The ringtones have been copied from default microsoft alarms: C:\Windows\Media.

The program must start with an empty settings.txt located in media, or one that is properlly formatted with the user's information. 
The inputs are not checked for validity. 
The break-time.jpg has been downloaded from the internet. Its link can be viewed in its properties.
