function configMenu() {
    $operation = $true

    $Prompt = "`n"
    $Prompt += "Please choose your operation:`n"
    $Prompt += "1 - Show Config`n"
    $Prompt += "2 - Change Config`n"
    $Prompt += "3 - Exit`n"

    while($operation){
        Write-host $prompt

        $choice = Read-Host
        
        if($choice -eq 1){
            $config = readConfig
            Write-Host ($config | Format-Table | Out-String)
        }
        elseif($choice -eq 2){
            changeConfig
        }
        elseif($choice -eq 3){
            return
        }
        else {
            Write-Host "please select a number 1-3"
            continue
        }

    } # End of while-loop
}# End of configMenu function

function readConfig() {
    $configFile = Join-Path $PSScriptRoot "configuration.txt"
    $days =   (Get-Content $configFile)[0]
    $exTime = (Get-Content $configFile)[1]
    $config = [pscustomobject]@{
                                'Days' = $days
                                'ExecutionTime' = $exTime
                                }
    return $config

} # End of readConfig

function changeConfig() {

    #Days input
    $daysOperation = $true
    $daysRegex = ''
    $daysInput

    $timeOperation = $true
    $timeRegex = 
    $timeInput

    
    Write-host "Please enter number of days back you want to check: "
    $daysPrompt

    While($daysOperation){
        $daysInput = Read-host
        
        if($daysInput -match '\d'){$daysOperation = $false}

        else{Write-Host "please input a number only"}
    }

    #Time input
    Write-Host "Please enter time you want to schedule (XX:XX AM/PM Format): "
    
    While($timeOperation){
        $timeInput = Read-host
        
        if($timeInput -match "\d\d:\d\d [AP]M"){$timeOperation = $false}

        else{Write-Host "Please Enter in XX:XX AM/PM Format only"}
    }

    $configFile = Join-Path $PSScriptRoot "configuration.txt"

    Set-Content -Path $configFile -Value $daysInput, $timeInput

    Write-Host "Configuration Changed"
} # End of changeConfig


#Run Menu
#configMenu