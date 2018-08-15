$InputFile = "C:\temp\Servers.txt"
$OutputFile= "C:\temp\Output.txt"
$Command = 'ENTER_COMMAND_HERE'
$RemoteComputers = Get-Content $InputFile
ForEach ($RemoteComputer in $RemoteComputers) {
        'Next Output From Server ' + $RemoteComputer | Out-File -FilePath $OutputFile -Append
        Invoke-Command -Computername $RemoteComputer -ScriptBlock {Invoke Expression -Command $Command} | Out-File -FilePath $OutputFile -Append
}
notepad.exe $OutputFile 
