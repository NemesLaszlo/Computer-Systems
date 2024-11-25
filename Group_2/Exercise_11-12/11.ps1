# .\11.ps1 -number1 10 -number2 2
# .\11.ps1 -number1 10 -number2 0 

param (
    [int]$number1,
    [int]$number2
)

# Check if both parameters are provided
if (-not $PSBoundParameters.ContainsKey('number1') -or -not $PSBoundParameters.ContainsKey('number2')) {
    Write-Error "Please provide two integer parameters: -number1 <value> -number2 <value>"
    exit 1
}

# Check if both parameters are integers
if ($number1 -isnot [int] -or $number2 -isnot [int]) {
    Write-Error "Both parameters must be integers."
    exit 1
}

try {
    # Perform the division
    $result = $number1 / $number2
    Write-Output "Result of division: $result"
}
catch {
    Write-Error "Error: $_"
    # Write-Error "Error: $_.Exception.Message"
}
