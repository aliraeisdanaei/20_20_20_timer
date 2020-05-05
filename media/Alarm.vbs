Set Alarm = CreateObject("WMPlayer.OCX.7")
Alarm.URL = "media\Alarm02.wav"
Alarm.Controls.play
do while Alarm.currentmedia.duration = 0
wscript.sleep 100
loop
wscript.sleep (int(Alarm.currentmedia.duration)+1)*1000
