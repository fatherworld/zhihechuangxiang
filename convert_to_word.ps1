# PowerShell Script to Convert HTML to Word
# Requires Microsoft Word to be installed

$HtmlFile = "劳务派遣协议.html"
$WordFile = "劳务派遣协议.docx"

try {
    # Create Word Application
    $Word = New-Object -ComObject Word.Application
    $Word.Visible = $false
    
    # Get full paths
    $CurrentDir = Get-Location
    $HtmlPath = Join-Path $CurrentDir $HtmlFile
    $WordPath = Join-Path $CurrentDir $WordFile
    
    Write-Host "Opening HTML file: $HtmlPath"
    
    # Open HTML document
    $Doc = $Word.Documents.Open($HtmlPath)
    
    Write-Host "Converting to Word format..."
    
    # Save as Word document
    $Doc.SaveAs2($WordPath, 16)
    
    # Close document and application
    $Doc.Close()
    $Word.Quit()
    
    Write-Host "Success! Word document saved as: $WordFile" -ForegroundColor Green
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please ensure Microsoft Word is installed and HTML file exists." -ForegroundColor Yellow
}
finally {
    if ($Word) {
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
    }
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}



