# .\16.ps1 -sourceDirectory "add_value_here" -destinationDirectory "Result_16" -extensionsInput "txt", "csv", "pdf"

param (
    [string]$sourceDirectory,
    [string]$destinationDirectory,
    [Parameter(Mandatory=$true)]
    [string[]]$extensionsInput
)

# Ensure the source directory exists
if (-not (Test-Path -Path $sourceDirectory -PathType Container)) {
    Write-Error "Source directory '$sourceDirectory' not found."
    exit 1
}

# Ensure the destination directory exists or create it
if (-not (Test-Path -Path $destinationDirectory -PathType Container)) {
    New-Item -ItemType Directory -Path $destinationDirectory | Out-Null
}

# Normalize the input extensions to lowercase for case-insensitive comparison
$normalizedExtensions = $extensionsInput | ForEach-Object { $_.ToLower() }

# Get all files in the source directory
$files = Get-ChildItem -Path $sourceDirectory -File

foreach ($file in $files) {
    # Ensure the file has an extension before processing
    $extension = $file.Extension.TrimStart('.').ToLower()
    Write-Output $extension
    # Only proceed if the file has an extension and it's in the list of specified extensions
    if ($extension -and $normalizedExtensions -contains $extension) {
        # Create a directory for the extension if it doesn't exist
        $extensionDirectory = Join-Path -Path $destinationDirectory -ChildPath $extension
        if (-not (Test-Path -Path $extensionDirectory -PathType Container)) {
            New-Item -ItemType Directory -Path $extensionDirectory | Out-Null
        }

        # Move the file to the corresponding directory
        $destinationPath = Join-Path -Path $extensionDirectory -ChildPath $file.Name
        Move-Item -Path $file.FullName -Destination $destinationPath -Force
        Write-Output "Moved $($file.FullName) to $($destinationPath)"
    }
    else {
        Write-Output "Skipped $($file.FullName) (extension not specified or not in the list)"
    }
}

Write-Output "Script execution completed."
