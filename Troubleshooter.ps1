#requires -Version 5.1
<# Created by Dewald Pretorius #>
param([string]$OutputPath)
if(-not $OutputPath){$OutputPath="$([Environment]::GetFolderPath('Desktop'))\Bookings_Reports"};New-Item $OutputPath -ItemType Directory -Force|Out-Null
$targets='book.ms','outlook.office.com','login.microsoftonline.com','graph.microsoft.com';$net=foreach($t in $targets){[pscustomobject]@{Target=$t;HTTPS443=(Test-NetConnection $t -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue)}}
@('MICROSOFT BOOKINGS SCHEDULING TROUBLESHOOTER','Created by Dewald Pretorius',"Generated: $(Get-Date)",($net|Format-Table -AutoSize|Out-String -Width 220),'Guidance: verify staff calendars, time zones, service duration, availability, mailbox permissions, notification settings, licence assignment, and external booking-page access.')|Set-Content (Join-Path $OutputPath 'Report.txt') -Encoding UTF8