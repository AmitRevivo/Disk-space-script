While ($true) {
    $RemainingSpaceString = Get-PSDrive C | % { $_.free/($_.used + $_.free) } | % tostring #Get the remaining disk space as a string
    [double] $RemainingDiskSpace = try { $RemainingSpaceString } catch { 0 } #Convert the remaining disk space from a string to a double
    if ($RemainingDiskSpace -lt 0.1) {
        $DocumentsPath = [Environment]::GetFolderPath("MyDocuments")
        $TheDate = Get-Date -Format "dd/MM/yyyy - HH:mm:ss"
        $TheDate | Out-File -FilePath "$DocumentsPath/DiskSpaceWarningLOG.txt" 
    }

    Start-Sleep -Seconds (5 * 60) #Allow the script to sleep for 5 minutes and than check again
}