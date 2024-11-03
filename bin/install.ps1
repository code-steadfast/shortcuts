<#
.DESCRIPTION
    Installation of Shortcuts
#>

param (
    [switch]$InPlace
)

Function Copy-Config {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$target,
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$source
    )
    robocopy $target $source /E /IS /IT
    if ($LASTEXITCODE -ge 8) {
        Write-Error "Copying '$source' failed"
    }
}

# Initial bootstrapping (scoop and other dependencies)
function Invoke-Bootstrap {
    # Download bootstrap scripts from external repository
    Invoke-RestMethod https://raw.githubusercontent.com/avengineers/bootstrap-installer/refs/tags/$bootstrap_git_tag/install.ps1 | Invoke-Expression
    # Execute bootstrap script
    . .\.bootstrap\bootstrap.ps1
}

## start of script
# Always set the $InformationPreference variable to "Continue" globally,
# this way it gets printed on execution and continues execution afterwards.
$InformationPreference = "Continue"

# Stop on first error
$ErrorActionPreference = "Stop"

$repoUrl = "https://github.com/xxthunder/shortcuts.git"
$shortcutsDir = "$Env:USERPROFILE\shortcuts"
$branch = "develop"

$bootstrap_git_tag = "v1.14.0"

if (-not $InPlace) {
    # Load utility methods
    Invoke-RestMethod -Uri https://raw.githubusercontent.com/avengineers/bootstrap/refs/tags/$bootstrap_git_tag/utils.ps1 | Invoke-Expression

    # Get the latest commit of this repository
    CloneOrPullGitRepo -RepoUrl $repoUrl -TargetDirectory $shortcutsDir -Branch $branch

    Push-Location $shortcutsDir
} else {
    # Run in place, no cloning
    Push-Location $PSScriptRoot.TrimEnd("\bin")
}

try {
    Invoke-Bootstrap

    # Create Keypirinha default settings
    Copy-Config "config\keypirinha\portable\Profile" "$Env:USERPROFILE\scoop\apps\keypirinha\current\portable\Profile"

    # Create directory for private shortcuts
    $shortcutsPrivateDir = "$Env:USERPROFILE\shortcuts_private"
    New-Item -Path $shortcutsPrivateDir -ItemType Directory -Force

    # Start Keypirinha
    & "$Env:USERPROFILE\scoop\apps\keypirinha\current\keypirinha.exe"

    Write-Output "Installation/Update of Shortcuts was successful."
}
finally {
    Pop-Location
    Read-Host -Prompt "Press Enter to continue ..."
}
## end of script
