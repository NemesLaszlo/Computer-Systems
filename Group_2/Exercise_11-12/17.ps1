# .\17.ps1 -sourceDirectory "path" -startDate "11/01/2024 00:00:00" -endDate "11/30/2024 23:59:59"

param (
    [string]$sourceDirectory,
    [string]$startDate,
    [string]$endDate
)

# Ensure the source directory exists
if (-not (Test-Path -Path $sourceDirectory -PathType Container)) {
    Write-Error "Source directory '$sourceDirectory' not found."
    exit 1
}

# Convert date strings to DateTime objects
$startDate = [datetime]::ParseExact($startDate, "MM/dd/yyyy HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture)
$endDate = [datetime]::ParseExact($endDate, "MM/dd/yyyy HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture)

# Get all files in the source directory modified within the specified date range
$modifiedFiles = Get-ChildItem -Path $sourceDirectory |
    Where-Object { $_.LastWriteTime -ge $startDate -and $_.LastWriteTime -le $endDate }

# Display the list of modified files
foreach ($file in $modifiedFiles) {
    Write-Output "$($file.FullName) - Last Modified: $($file.LastWriteTime)"
}

Write-Output "Script execution completed."
