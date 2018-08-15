# Variable String for Input File
$InputFile = "C:\temp\Servers.txt"
# Variable String for Output File
$OutputFile = "C:\temp\Output.txt"
# Insert command to run remotely in the next line between ''
$Command = 'ENTER_COMMAND_HERE'
$RemoteComputers = Get-Content $InputFile
ForEach ($RemoteComputer in $RemoteComputers) {
        'Next Output From Server ' + $RemoteComputer | Out-File -FilePath $OutputFile -Append
        Invoke-Command -Computername $RemoteComputer -ScriptBlock {Invoke-Expression -Command $Command} | Out-File -FilePath $OutputFile -Append
}
notepad.exe $OutputFile 
