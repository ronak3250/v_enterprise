Add-Type -AssemblyName System.Drawing
Get-ChildItem assets/*.jpg | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    Write-Host "$($_.Name): width=$($img.Width), height=$($img.Height)"
    $img.Dispose()
}
Get-ChildItem assets/brochures/*.jpg | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    Write-Host "brochures/$($_.Name): width=$($img.Width), height=$($img.Height)"
    $img.Dispose()
}
