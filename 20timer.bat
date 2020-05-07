:: Authour Ali Raeisdanaei
::Summer 2020

@echo off
title 20timer
mode con:cols=60 lines=15
::relative paths are used during the program

::the following two lines of code are from the internet
::it checkes if the media\settings.txt is not empy meaning there has already been a set up
for /f %%i in ("media\settings.txt") do set size=%%~zi
if %size% gtr 0 goto :initialisation

:InitialSetup
cls 
color 02
echo Hello and Welcome!
echo.
echo I was designed to remind you to take a break from looking at the screen. 
echo To avoid eye strain you need to take a 20 second break every 20 minutes to look 20 feet away.
echo I can remind you by telling you, sounding a ringtone, and or openning a pop up. 
echo.
echo I just need to know your name and preferences. 
pause

cls 
color 02
echo #----------------------Initial Set-Up----------------------#
echo. 
echo.
goto :setup

:resetup
cls 
color 02
echo #--------------------------Set-Up--------------------------#
echo. 
echo.

:setup
set speech=0
set popup=0
set /p name="Enter your name: "
set /p workTime="Enter your desired work time in minutes: "
set /p breakTime="Enter your desired break time in seconds: "
set /p speech= "To enable speech press 1 otherwise press any key: "
set /p popup= "To enable a popup press 1 otherwise press any key: "
set returnAddress=setupReturn
goto :setRingTone
:setupReturn
echo %name%**%workTime%**%breakTime%**%speech%**%popup%**%ringtone% > media\settings.txt

goto :menu


:initialisation
::retrieves the data from settings
for /F "tokens=1-6 delims=**" %%A IN (media\settings.txt) DO (
    set name=%%A
    set workTime=%%B
    set breakTime=%%C
    set speech=%%D
    set popup=%%E
    set ringtone=%%F
    
)


:menu 
cls
color 02
echo.
echo #----------------------------------------------------------#
echo #----------------------20/20/20 TIMER----------------------#
echo #----------------------------------------------------------#

echo.
echo.
echo                          --MENU--
echo                        (1) Timer
echo                        (2) Settings
echo                        (3) About
echo                        (4) Quit
echo.
echo.

echo Welcome back %name%. 
set choice=0
set /p choice="Enter your choice: "
if %choice% == 1 goto :work
if %choice% == 2 goto :settings
if %choice% == 3 goto :about
if %choice% == 4 goto :quit
goto :menu

:work
set min=%workTime%
set sec=0


:work_countDown
cls
color 2F

echo #------------------------Work Time-------------------------#

echo. 
echo. 
echo TIME TO NEXT BREAK:    %min% : %sec%

::decreasing time in minutes

if not %min% LEQ 0 goto :timer
if %sec% LEQ 1 goto :break
REM echo hello ------------------------%sec%
REM if %sec% == 0 pause

:timer
timeout /t 5 /nobreak > media\junk
if %sec% LEQ 0 goto :minute_Decrease
set /a sec= %sec% -5

goto :work_countDown

:minute_Decrease
set /a min=%min%-1
set sec=55

goto :work_countDown

:break
set sec=%breakTime%

::pop ups and sound
if not %popup% == 1 goto :playSpeech
start media\break-time.jpg

:playSpeech
::the voice code is from the internet
if not %speech% == 1 goto :playRingtone
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "media\speech.vbs"
set text=Time to take a break %name%. %name% take a break.
echo speech.speak "%text%" >> "media\speech.vbs"
start media\speech.vbs


:playRingtone
echo.
if not %ringtone% == Empty (
    start /b media\play.bat media\%ringtone%
)

:break_countdown
cls
color c0

echo #---------------------Taking a Break-----------------------#
echo.
echo. 
echo Take a break %name%!
echo. 
echo.

echo TIME REMAINING OF BREAK:    %sec%

::decreasing time in second
timeout /t 1 /nobreak > media\junk
set /a sec= %sec% - 1
if not %sec% LEQ 0 goto :break_countdown

:breakOver
::speech and ringtone again
if not %speech% == 1 goto :playRingtone_Break
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "media\speechBreak.vbs"
set text=Break Time now over. You can go back to work %name%.
echo speech.speak "%text%" >> "media\speechBreak.vbs"
start media\speechBreak.vbs


:playRingtone_Break
echo.
if not %ringtone% == Empty (
    start /b media\play.bat media\%ringtone%
)


REM :breakdirectory
REM cls
REM color 4F
REM echo That was a much needed break.
REM set choice=0
REM set /p choice= "Do you want to go back to work?(Y/N)"
REM del media\speech.vbs
REM del media\speechBreak.vbs
REM 
REM if %choice% == y goto :work
REM if %choice% == n goto :menu
REM goto :breakdirectory

REM it goes directly to work now instead of asking the user
goto :work


:settings
echo %name%**%workTime%**%breakTime%**%speech%**%popup%**%ringtone% > media\settings.txt

cls
color 02
echo #-------------------------Settings-------------------------#
echo name : %name%  
echo work time : %workTime% minutes
echo break time : %breakTime% seconds
if %speech% == 1 (
    echo speech: enabled

)
if not %speech% == 1 (
    echo speech: disabled
)
if %popup% == 1 (
    echo popup: enabled
)
if not %popup% == 1 (
    echo popup: disabled
)

if %ringtone% == Alarm02 echo ringtone: Beeps
if %ringtone% == Alarm03 echo ringtone: Harmony
if %ringtone% == Alarm06 echo ringtone: Electricity
if %ringtone% == Alarm08 echo ringtone: Wind Chimes
echo.
echo (1) change name                   (5) enable/disable popup
echo (2) change work time              (6) change ringtone
echo (3) change break time             (7) re-restup
echo (4) enable/disable speech         (8) go back to menu
echo.
set choice=0
set /p choice="Enter your choice: "
if %choice% == 1 goto :changeName
if %choice% == 2 goto :changeWorkTime
if %choice% == 3 goto :changeBreakTime
if %choice% == 4 goto :changeSpeech
if %choice% == 5 goto :changePopUp
if %choice% == 6 (
    set returnAddress=settings
    goto :setRingTone
)
if %choice% == 7 goto :resetup
if %choice% == 8 goto :menu
goto :settings


:changeName
cls
color 02
set /p name="Enter your name: "

goto :settings

:changeWorkTime
cls
color 02
set /p workTime="Enter your new work time in minutes: "
echo Your new work time is %workTime%.

pause
goto :settings


:changeBreakTime
cls
color 02
set /p breakTime="Enter your new break time in seconds: "
echo Your new break time is %breakTime%.

pause
goto :settings

:changeSpeech
cls
color 02
set /p speech="To enable speech press 1 otherwise press any key: "
if %speech% == 1 (
    echo speech is now enabled
)
if not %speech% == 1 (
    echo speech is now disabled
)
pause
goto :settings

:changePopUp
cls
color 02
set /p popup="To enable popup press 1 otherwise press any key: "
if %popup% == 1 (
    echo popup is now enabled
)
if not %popup% == 1 (
    echo popup is now disabled
)
pause
goto :settings

:setRingTone
cls
color 02
echo Choose a ringtone
echo Here are the ringtones:
echo (1) Beebs
echo (2) Harmony
echo (3) Electricity
echo (4) Wind Chimes
echo (5) No Ring Tone
echo.
echo To hear a ringtone press H followed by its number (Ex.. H1)
set choice=0
set /p choice= "Enter your choice: "
if %choice% == H1 start /b media\play.bat media\Alarm02
if %choice% == H2 start /b media\play.bat media\Alarm03
if %choice% == H3 start /b media\play.bat media\Alarm06
if %choice% == H4 start /b media\play.bat media\Alarm08
if %choice% == 1 (
    set ringtone=Alarm02
    pause
    goto :%returnAddress%
)
if %choice% == 2 (
    set ringtone=Alarm03
    pause
    goto :%returnAddress%
)
if %choice% == 3 (
    set ringtone=Alarm06
    pause
    goto :%returnAddress%
)
if %choice% == 4 (
    set ringtone=Alarm08
    pause
    goto :%returnAddress%
)
if %choice% == 5 (
    set ringtone=Empty
    pause
    goto :%returnAddress%
)

goto :setRingTone


:quit
cls
set choice=0
set /p choice= "Are you sure you want to quit?(Y/N): "
if %choice% == y exit
if %choice% == n goto :menu
goto :quit

pause

:about
cls
color 02
echo This program was created to help people take 20/20/20 breaks while on the computer. 
echo To avoid eye strain a break is needed at least every 20 minutes for 20 seconds to look 20 feet away. 
echo It was developped in the summer of 2020 by Ali Raeisdanaei. 
echo It was inspired by his father who wanted something that would remind him to take 20/20/20 breaks.
echo He was not taking 20/20/20 breaks while writing this program. 
echo This program is free to use and download, however it is the rightful property of Ali Raeisdanaei
echo. 
echo. 

pause
goto :menu


pause
exit