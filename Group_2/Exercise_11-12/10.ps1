# .\10.ps1 -inputFilePath "10.txt"

param (
    [string]$inputFilePath
)


[string[]]$lines = Get-Content $inputFilePath

# Loop through each line in the file
foreach ($line in $lines) {
    # Split the line into two words
    [string[]]$words = $line -split ' '

    # Check if there are two words on the line
    if ($words.Count -eq 2) {
        # Swap word1 with word2
        [string]$newLine = "$($words[1]) $($words[0])"

        # Output the modified line
        Write-Output $newLine
    } else {
        # Output lines that don't have exactly two words
        Write-Output "Skipping line: $line"
    }
}