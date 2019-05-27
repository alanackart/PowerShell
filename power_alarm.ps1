
Function battery_status {
   $Bstatus = (Get-WmiObject -Class Win32_Battery -ea 0).BatteryStatus
   return $Bstatus
}


Function play_beep {
    Param($times)
    For ($i=0; $i -lt $times; $i++) {
        [Console]::Beep(440,400)
        $status = battery_status
        if(  -NOT  ($status -eq 1) ) {
            echo $status
            break
        }
    
    }
}

while(1){
    $status = battery_status
    echo $status
    if(  -NOT  ($status -eq 2) ) {
        play_beep  600
    }
    sleep(10)
}
# PowerShell.exe -file  power_alarm.ps1

#[System.Media.SystemSounds]::Beep.Play()  
  
	# 1 { "Battery is discharging" }
    # 2 { "The system has access to AC so no battery is being discharged. However, the battery is not necessarily charging." }
    # 3 { "Fully Charged" }
    # 4 { "Low" }
    # 5 { "Critical" }
    # 6 { "Charging" }
    # 7 { "Charging and High" }
    # 8 { "Charging and Low" }
    # 9 { "Charging and Critical " }
    # 10 { "Unknown State" }
    # 11 { "Partially Charged" }  
# G:\Users\Alan\Documents\power_alarm.ps1
