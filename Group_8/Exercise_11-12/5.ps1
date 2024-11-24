# .\5.ps1 -number 5 
# .\5.ps1 -number 6

param (
    [int]$number
)

function IsPrime([int]$n) {
    if ($n -le 1) {
        return $false
    }

    for ($i = 2; $i -lt $n; $i++) {
        if ($n % $i -eq 0) {
            return $false
        }
    }

    return $true
}

# Check if the provided number is prime
if (IsPrime $number) {
    Write-Host "$number is a prime number."
} else {
    Write-Host "$number is not a prime number."
}