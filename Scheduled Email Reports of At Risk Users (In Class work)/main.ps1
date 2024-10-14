. "C:\CSI230\CSI-230-Week-7\Scheduled Email Reports of At Risk Users (In Class work)\configuration.ps1"
. "C:\CSI230\CSI-230-Week-7\Scheduled Email Reports of At Risk Users (In Class work)\email.ps1"
. "C:\CSI230\CSI-230-Week-7\Scheduled Email Reports of At Risk Users (In Class work)\scheduler.ps1"\
. "C:\CSI230\CSI-230-Week-6\Local User Management Menu (In Class Work)\Event-Log.ps1"


$configuration = readConfig
$failed = getAtRiskUsers $configuration.Days

SendAlertEmail ($Failed | Format-Table | Out-String)

ChoseTimeToRun($configuration.ExecutionTime)