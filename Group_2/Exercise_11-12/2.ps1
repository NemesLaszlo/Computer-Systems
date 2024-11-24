# .\2.ps1 -numbers 1,2,3,4,5

param (
    [double[]]$numbers
)

function CalculateSum([double[]]$numbers) {
    $sum = 0
    foreach ($num in $numbers) {
        $sum += $num
    }
    return $sum
}

# Check if parameters are provided
if ($null -eq $numbers -or $numbers.Count -eq 0) {
    Write-Host "Please provide at least one number as a parameter."
}
else {
    [double]$result = CalculateSum $numbers
    Write-Host "Sum of provided numbers is $result"
}
