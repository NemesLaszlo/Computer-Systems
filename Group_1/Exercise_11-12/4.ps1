# .\4.ps1 -inputfile .\4.txt

param (
    [string]$inputFile
)

# Check if the input file exists
if (-not (Test-Path $inputFile -PathType Leaf)) {
    Write-Host "Error: Input file does not exist."
    exit
}
# -PathType Leaf: This option checks whether the specified path points to a leaf item, which typically means a file.

# Output file names for even and odd lines
$evenLinesFile = "EvenLines.txt"
$oddLinesFile = "OddLines.txt"

# Initialize line counters
$lineNumber = 1
$evenLines = @()
$oddLines = @()

# Read input file and separate even and odd lines
Get-Content $inputFile | ForEach-Object {
    if ($lineNumber % 2 -eq 0) {
        $evenLines += $_
    } else {
        $oddLines += $_
    }
    $lineNumber++
}

# Write even lines to file
$evenLines | Out-File -FilePath $evenLinesFile

# Write odd lines to file
$oddLines | Out-File -FilePath $oddLinesFile

Write-Host "Even lines copied to $evenLinesFile"
Write-Host "Odd lines copied to $oddLinesFile"
