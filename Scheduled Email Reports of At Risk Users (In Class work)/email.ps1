function sendAlertEmail($Body){

    $From = "matthew-akiva.nugent@mymail.champlain.edu"
    $To = "matthew-akiva.nugent@mymail.champlain.edu"
    $Subject = "Suspicious Activity"

    $Password = "pvsk ltba tcns snca" | ConvertTo-SecureString -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
                     -Port 587 -UseSsl -Credential $Credential

}

#sendAlertEmail "Body of Email"


