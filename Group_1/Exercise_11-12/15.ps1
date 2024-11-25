# .\15.ps1 -neptunCodesFilePath "15.txt" -outputFilePath "15result.txt" 
# .\15.ps1 -neptunCodesFilePath "15.txt" -outputFilePath "15result.txt" -passwordLength 4

param (
    [string]$neptunCodesFilePath,
    [string]$outputFilePath,
    [int]$passwordLength = 12
)

function GeneratePassword {
    param (
        [int]$length
    )

    $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:'<>,.?/"
   
    $password = -join (0..($length - 1) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
    return $password
}
# -join: This operator concatenates the characters generated in the loop into a single string, forming the final password
# (0..($length - 1)): This part creates a range of numbers from 0 to $length - 1. It represents the positions of characters in the password

$neptunCodes = Get-Content $neptunCodesFilePath

# Generate passwords for each Neptun code
$passwords = foreach ($code in $neptunCodes) {
    $password = GeneratePassword -length $passwordLength
    "$code : $password"
}

# Write the passwords to the output file
$passwords | Out-File -FilePath $outputFilePath

# Display a success message
Write-Output "Passwords generated and saved to $outputFilePath"

