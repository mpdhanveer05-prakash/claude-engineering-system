<#
.SYNOPSIS
Archive a sunset project: move to 02_ARCHIVED_PROJECTS and append a one-line log entry.

.PARAMETER Slug
Project slug (folder under 01_ACTIVE_PROJECTS).

.PARAMETER Reason
One-line reason for sunset (will appear in the archive log).

.PARAMETER Successor
Optional successor project / system slug.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string]$Slug,
    [Parameter(Mandatory)][string]$Reason,
    [string]$Successor = "(none)"
)

$ErrorActionPreference = "Stop"
$root  = Split-Path $PSScriptRoot -Parent
$src   = Join-Path $root "01_ACTIVE_PROJECTS\$Slug"
$dst   = Join-Path $root "02_ARCHIVED_PROJECTS\$Slug"
$log   = Join-Path $root "02_ARCHIVED_PROJECTS\README.md"

if (-not (Test-Path $src)) { throw "Active project not found: $src" }
if (Test-Path $dst)        { throw "Archive slot already used: $dst" }

if ($PSCmdlet.ShouldProcess($src, "Move to $dst")) {
    Move-Item -Path $src -Destination $dst
    $finalCommit = (git -C $dst log -1 --pretty=format:"%h %s" 2>$null)
    if (-not $finalCommit) { $finalCommit = "n/a" }
    $today = (Get-Date).ToString("yyyy-MM-dd")
    $entry = "| $today | $Slug | $Reason | $Successor | $finalCommit |"
    Add-Content -Path $log -Value $entry
    Write-Host "Archived $Slug." -ForegroundColor Green
    Write-Host "Log entry appended to $log" -ForegroundColor Cyan
}
