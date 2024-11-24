# .\7.ps1 -start 10 -end 50

param (
    [int]$start,
    [int]$end
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

# Check if the start and end values are valid
if ($start -ge $end -or $start -lt 0) {
    Write-Host "Please provide valid values for the interval (start should be less than end, and both should be non-negative)."
}
else {
    Write-Host "Prime numbers in the interval [$start, $end]:"

    for ($num = $start; $num -le $end; $num++) {
        if (IsPrime $num) {
            Write-Host $num
        }
    }
}
