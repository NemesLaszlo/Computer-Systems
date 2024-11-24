# .\6.ps1 -number1 24 -number2 36

param (
    [int]$number1,
    [int]$number2
)

function GetGCD($a, $b) {
    # Using the Euclidean algorithm:
    while ($b -ne 0) {
        $temp = $b # Temporarily stores the value of $b
        $b = $a % $b #  Sets $b to the remainder of the division of $a by $b (osztási maradék)
        $a = $temp # Updates $a to the value of $b that was stored in $temp
    }
    return $a # Returns $a as the GCD
}

# Check if both numbers are non-negative
if ($number1 -lt 0 -or $number2 -lt 0) {
    Write-Host "Please provide two non-negative integers."
}
else {
    $gcd = GetGCD $number1 $number2
    Write-Host "The greatest common divisor of $number1 and $number2 is $gcd."
}