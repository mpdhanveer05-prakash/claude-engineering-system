<#
.SYNOPSIS
Bootstrap a new project from UNIVERSAL_PROJECT_TEMPLATE.

.PARAMETER Slug
Project slug (kebab-case), becomes the folder name.

.PARAMETER Type
Optional specialized overlay: web | mobile | saas | api | ai-agent | enterprise | monorepo | mvp | crm-erp.

.EXAMPLE
./bootstrap-project.ps1 -Slug my-app -Type web
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Slug,
    [ValidateSet("web","mobile","saas","api","ai-agent","enterprise","monorepo","mvp","crm-erp","")]
    [string]$Type = ""
)

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$src  = Join-Path $root "00_TEMPLATES\UNIVERSAL_PROJECT_TEMPLATE"
$dst  = Join-Path $root "01_ACTIVE_PROJECTS\$Slug"

if (Test-Path $dst) {
    throw "Destination already exists: $dst"
}
if (-not (Test-Path $src)) {
    throw "Template not found: $src"
}

Write-Host "Copying UNIVERSAL_PROJECT_TEMPLATE -> $dst" -ForegroundColor Cyan
Copy-Item -Recurse -Path $src -Destination $dst

if ($Type -ne "") {
    $overlay = switch ($Type) {
        "web"        { "WEB_APP_TEMPLATE" }
        "mobile"     { "MOBILE_APP_TEMPLATE" }
        "saas"       { "SAAS_TEMPLATE" }
        "api"        { "API_BACKEND_TEMPLATE" }
        "ai-agent"   { "AI_AGENT_TEMPLATE" }
        "enterprise" { "ENTERPRISE_TEMPLATE" }
        "monorepo"   { "MONOREPO_TEMPLATE" }
        "mvp"        { "MVP_STARTUP_TEMPLATE" }
        "crm-erp"    { "CRM_ERP_TEMPLATE" }
    }
    $overlaySrc = Join-Path $root "00_TEMPLATES\$overlay"
    if (Test-Path $overlaySrc) {
        Write-Host "Overlaying $overlay" -ForegroundColor Cyan
        Copy-Item -Recurse -Force -Path "$overlaySrc\*" -Destination $dst
    } else {
        Write-Warning "Overlay not found: $overlaySrc — skipping"
    }
}

Set-Location $dst
if (-not (Test-Path ".git")) {
    git init -b main | Out-Null
    git add -A | Out-Null
    git commit -m "chore: scaffold $Slug from UNIVERSAL_PROJECT_TEMPLATE" | Out-Null
}

Write-Host ""
Write-Host "Bootstrapped: $dst" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Open in editor and fill out CLAUDE.md"
Write-Host "  2. Fill out docs/product/PRD-v1.md"
Write-Host "  3. Walk PROJECT_BOOTSTRAP_CHECKLIST.md"
