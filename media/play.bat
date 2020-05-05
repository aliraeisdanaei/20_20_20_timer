::code from the internet
@echo off
::this is to not change the title of the window already open
title 20timer

set "file=%1.wav"
( echo Set Alarm = CreateObject("WMPlayer.OCX.7"^)
  echo Alarm.URL = "%file%"
  echo Alarm.Controls.play
  echo do while Alarm.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Alarm.currentmedia.duration^)+1^)*1000) >media\Alarm.vbs
start /min media\Alarm.vbs

REM echo.
REM pause

ping localhost -n 10 >nul
exit