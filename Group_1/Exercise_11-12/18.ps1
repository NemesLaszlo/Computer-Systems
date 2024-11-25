# .\18.ps1 -sourceDirectory "path"

param (
    [string]$sourceDirectory,
    [int]$minimumSizeInBytes = 1MB # Default minimum size is 1 MB
)

# Ensure the source directory exists
if (-not (Test-Path -Path $sourceDirectory -PathType Container)) {
    Write-Error "Source directory '$sourceDirectory' not found."
    exit 1
}

# Get all files in the source directory larger than the specified size
$largeFiles = Get-ChildItem -Path $sourceDirectory |
    Where-Object { $_.Length -gt $minimumSizeInBytes }

# Display the list of larger files
foreach ($file in $largeFiles) {
    Write-Output "$($file.FullName) - Size: $($file.Length) bytes"
}

Write-Output "Script execution completed."
