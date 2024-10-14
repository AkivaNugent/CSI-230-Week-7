function ChoseTimeToRun($Time){
    $scheduledTime = Get-ScheduledTask | Where-Object { $_.TaskName -ilike "myTask"}

    if($scheduledTime -ne $null){
        Write-Host "The task already exists" | Out-String
        DisableAutoRun
    }
       
    Write-Host "Creating new task." | Out-String

    $action = New-ScheduledTaskAction -Execute "powershell.exe" `
              -argument "-File `"C:\CSI230\CSI-230-Week-7\Scheduled Email Reports of At Risk Users (In Class work)\main.ps1`""

    $trigger = New-ScheduledTaskTrigger -Daily -At $Time
    $principal = New-ScheduledTaskPrincipal -UserId 'champuser' -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailible -WakeToRun
    $task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings

    Register-ScheduledTask 'myTask' -InputObject $task

    Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}
} #End of ChoseTimeToRun()



function DisableAutoRun() {
    $scheduledTasks = Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}

    if($scheduledTasks -ne $null){
        Write-Host "Unregistering the task" | Out-String
        Unregister-ScheduledTask -TaskName 'myTask' -Confirm:$false
    }
    else{
        Write-Host "The task is not registered" | Out-String
    }

} #End of disableAutoRun()