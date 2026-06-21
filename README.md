# Microsoft Bookings Scheduling Troubleshooter

PowerShell 5.1 diagnostics and guarded repair tooling created by **Dewald Pretorius**.

`Troubleshooter.ps1` collects scheduling evidence. `Repair.ps1` provides read-only diagnosis, reversible Teams/Edge cache reset, and DNS-cache repair for Bookings client-access issues.

```powershell
.\Troubleshooter.ps1
.\Repair.ps1 -Action Diagnose
.\Repair.ps1 -Action ResetCache -DryRun
.\Repair.ps1 -Action ResetCache -Yes
```

Cache data is moved to timestamped backup folders before clean folders are created. Mutating actions require confirmation unless `-Yes` is supplied. Every run writes a log and a pre-repair JSON snapshot. Source-reviewed; not runtime-tested against every Microsoft 365 tenant.
