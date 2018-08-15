# Variable String for Input File
$InputFile = "C:\temp\Servers.txt"
# Variable String for Output File
$OutputFile = "C:\temp\Output.txt"
$RemoteComputers = Get-Content $InputFile
ForEach ($RemoteComputer in $RemoteComputers) {
        'Next Output From Server ' + $RemoteComputer | Out-File -FilePath $OutputFile -Append
        Invoke-Command -Computername $RemoteComputer -ScriptBlock {INSERT_COMMAND_TO_BE_RUN_REMOTELY_HERE} | Out-File -FilePath $OutputFile -Append
}
notepad.exe $OutputFile 
