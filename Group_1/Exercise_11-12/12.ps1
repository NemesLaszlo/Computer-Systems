param (
    [string[]]$filesToDelete
)

foreach ($file in $filesToDelete) {
    try {
        # Attempt to delete the file
        Remove-Item -Path $file -ErrorAction SilentlyContinue -Force

        # Output a success message
        Write-Output "Deleted file: $file"
    }
    catch {
        # Output an error message if deletion fails
        Write-Error "Error deleting file $file: $_.Exception.Message"
    }
}
