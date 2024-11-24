# .\8.ps1 -inputFile "8.txt" -outputFile "decoded_emails.txt"    

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
$encodedEmails = Get-Content $inputFile

# Decode the email addresses
$decodedEmails = foreach ($encodedEmail in $encodedEmails) {
    $decodedEmail = $encodedEmail -replace ' kukac ', '@' -replace ' point ', '.'
    $decodedEmail
}

# Display the decoded email addresses on the console
Write-Host "Decoded Email Addresses:"
$decodedEmails | ForEach-Object {
    Write-Host $_
}

# Write the decoded email addresses to the output file
$decodedEmails | Out-File -FilePath $outputFile

Write-Host "Decoded email addresses are also written to $outputFile."
