Add-Type -AssemblyName System.Drawing
Get-ChildItem assets/company_logo* | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    Write-Host "$($_.Name): width=$($img.Width), height=$($img.Height)"
    $img.Dispose()
}
