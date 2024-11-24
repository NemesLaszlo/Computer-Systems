# quadratic equation (ax^2 + bx + c = 0)
# a = 1 b = -3 c = 2 -> Root1: 2, Root2: 1

$a = Read-Host "Enter the coefficient a"
$b = Read-Host "Enter the coefficient b"
$c = Read-Host "Enter the coefficient c"

# Convert the input to numerical values
$a = [double]$a
$b = [double]$b
$c = [double]$c

# Calculate the discriminant
$discriminant = $b * $b - 4 * $a * $c

# Check if the discriminant is positive, negative, or zero
if ($discriminant -gt 0) {
    $root1 = (-$b + [math]::sqrt($discriminant)) / (2 * $a)
    $root2 = (-$b - [math]::sqrt($discriminant)) / (2 * $a)
    Write-Host "Two distinct real roots: Root1 = $root1, Root2 = $root2"
}
elseif ($discriminant -eq 0) {
    $root = -$b / (2 * $a)
    Write-Host "One real root: Root = $root"
}
else {
    $realPart = -$b / (2 * $a)
    $imaginaryPart = [math]::sqrt(-$discriminant) / (2 * $a)
    Write-Host "Complex roots: Root1 = $realPart + ${imaginaryPart}i, Root2 = $realPart - ${imaginaryPart}i"
}
