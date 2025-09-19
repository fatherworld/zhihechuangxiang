# Convert Employee Contract to Word
$HtmlFile = "员工劳务派遣协议.html"
$WordFile = "员工劳务派遣协议.docx"

try {
    $Word = New-Object -ComObject Word.Application
    $Word.Visible = $false
    
    $CurrentDir = Get-Location
    $HtmlPath = Join-Path $CurrentDir $HtmlFile
    $WordPath = Join-Path $CurrentDir $WordFile
    
    Write-Host "Converting: $HtmlPath"
    
    $Doc = $Word.Documents.Open($HtmlPath)
    $Doc.SaveAs2($WordPath, 16)
    
    $Doc.Close()
    $Word.Quit()
    
    Write-Host "Success! Created: $WordFile" -ForegroundColor Green
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    if ($Word) {
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
    }
    [System.GC]::Collect()
}



