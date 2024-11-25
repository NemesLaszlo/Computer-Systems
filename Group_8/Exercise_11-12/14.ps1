# .\14.ps1 -identifiersFilePath "14.txt"

param (
    [string]$identifiersFilePath,
    [string]$readmeContent = "This is the readme file for the user."
)

# Read the content of the identifiers file
[string[]]$identifiers = Get-Content $identifiersFilePath

foreach ($identifier in $identifiers) {
    # Construct the directory path based on the identifier
    [string]$directoryPath = "$pwd\$identifier"

    # Check if the directory already exists
    if (-not (Test-Path -Path $directoryPath -PathType Container)) {
        # -PathType Container: This option checks whether the specified path points to a container item, which generally means a directory or folder.
        # If not, create the directory
        # When you pipe the result of a command to Out-Null, it ensures that the output is not displayed in the console or returned to the pipeline.
        New-Item -ItemType Directory -Path $directoryPath | Out-Null
        Write-Output "Created directory: $directoryPath"

        # Copy the readme.txt file into the directory
        $readmeFilePath = Join-Path -Path $directoryPath -ChildPath 'readme.txt'
        $readmeContent | Out-File -FilePath $readmeFilePath
        Write-Output "Copied readme.txt to: $readmeFilePath"
    } else {
        Write-Output "Directory already exists: $directoryPath"
    }
}

Write-Output "Script execution completed."
