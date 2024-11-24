# .\9.ps1 -inputFile "9.txt" -outputFile "ReversedFile.txt"

param (
    [string]$inputFile,
    [string]$outputFile
)

# Check if the input file exists
if (-not (Test-Path $inputFile -PathType Leaf)) {
    Write-Host "Error: Input file does not exist."
    exit
}

# Read the content of the input file
$lines = Get-Content $inputFile

# Reverse the order of lines
$reversedLines = $lines | Select-Object -Property @{Name='Line'; Expression={$_.Trim()}} | Sort-Object -Descending Line | Select-Object -ExpandProperty Line

# $lines | Select-Object -Property @{Name='Line'; Expression={$_.Trim()}}: This pipeline step creates a custom object for each line with a single property named Line, which is the trimmed content of the line.
# Sort-Object -Descending Line: This sorts the objects based on the 'Line' property in descending order. This effectively reverses the order of the lines.
# Select-Object -ExpandProperty Line: This selects only the 'Line' property from the sorted objects, effectively giving you an array of the lines in reversed order. (Extracts the Line property values from the sorted objects, resulting in an array of the reversed lines.)

# Display the reversed lines on the console
Write-Host "Reversed Lines:"
$reversedLines | ForEach-Object {
    Write-Host $_
}

# Write the reversed lines to the output file
$reversedLines | Out-File -FilePath $outputFile

Write-Host "Reversed lines are also written to $outputFile."
