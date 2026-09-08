Add-Type -AssemblyName System.Drawing

function Resize-Image {
    param(
        [string]$SourcePath,
        [string]$DestinationPath,
        [int]$Width,
        [int]$Height
    )
    $srcImg = [System.Drawing.Image]::FromFile($SourcePath)
    $destBmp = New-Object System.Drawing.Bitmap($Width, $Height)
    $g = [System.Drawing.Graphics]::FromImage($destBmp)
    
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality

    $g.DrawImage($srcImg, 0, 0, $Width, $Height)
    
    $destBmp.Save($DestinationPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $g.Dispose()
    $destBmp.Dispose()
    $srcImg.Dispose()
    Write-Host "Created $DestinationPath ($Width x $Height)"
}

$source = "assets/company_logo.jpeg"
if (-not (Test-Path $source)) {
    $source = "assets/company_logo_light.jpg"
}

# Create output favicons & icons
Resize-Image -SourcePath $source -DestinationPath "web/favicon.png" -Width 64 -Height 64
Resize-Image -SourcePath $source -DestinationPath "favicon.png" -Width 64 -Height 64
Resize-Image -SourcePath $source -DestinationPath "web/icons/Icon-192.png" -Width 192 -Height 192
Resize-Image -SourcePath $source -DestinationPath "web/icons/Icon-512.png" -Width 512 -Height 512
Resize-Image -SourcePath $source -DestinationPath "web/icons/Icon-maskable-192.png" -Width 192 -Height 192
Resize-Image -SourcePath $source -DestinationPath "web/icons/Icon-maskable-512.png" -Width 512 -Height 512
Resize-Image -SourcePath $source -DestinationPath "assets/ve_logo_icon.png" -Width 256 -Height 256
Resize-Image -SourcePath $source -DestinationPath "assets/ve_logo_icon_sm.png" -Width 64 -Height 64

Write-Host "All favicons generated successfully!"
