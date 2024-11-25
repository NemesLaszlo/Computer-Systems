# .\13.ps1 -inputFilePath "13.txt" -outputFilePath "13out.txt" -searchString "55"

param (
    [string]$inputFilePath,
    [string]$outputFilePath,
    [string]$searchString
)

# Read the content of the input file
[string[]]$fileContent = Get-Content $inputFilePath

# Filter lines containing the search string
$matchingLines = $fileContent | Where-Object { $_ -match $searchString }

# Write matching lines to the output file
$matchingLines | Out-File -FilePath $outputFilePath

# Display a success message
Write-Output "Lines containing '$searchString' copied to $outputFilePath"
