# .\1.ps1 -number 5

param (
    [int]$number
)

function CalculateFactorial([int]$n) {
    if ($n -eq 0 -or $n -eq 1) {
        return 1
    }
    else {
        return [int]($n * (CalculateFactorial($n - 1)))
    }
}

# Check if the provided number is non-negative
if ($number -lt 0) {
    Write-Host "Please provide a non-negative integer."
}
else {
    $result = CalculateFactorial $number
    Write-Host "Factorial of $number is $result"
}
