# Final conversion script
$HtmlFile = "员工劳务派遣协议.html"
$WordFile = "深圳智核创享员工劳动合同_最终版.docx"

try {
    $Word = New-Object -ComObject Word.Application
    $Word.Visible = $false
    
    $CurrentDir = Get-Location
    $HtmlPath = Join-Path $CurrentDir $HtmlFile
    $WordPath = Join-Path $CurrentDir $WordFile
    
    Write-Host "Converting: $HtmlFile to $WordFile"
    
    $Doc = $Word.Documents.Open($HtmlPath)
    $Doc.SaveAs2($WordPath, 16)
    
    $Doc.Close()
    $Word.Quit()
    
    Write-Host "SUCCESS: $WordFile created!" -ForegroundColor Green
}
catch {
    Write-Host "Conversion failed. Use manual method:" -ForegroundColor Red
    Write-Host "1. Open $HtmlFile in browser" -ForegroundColor Yellow
    Write-Host "2. Print to PDF" -ForegroundColor Yellow
    Write-Host "3. Convert PDF to Word" -ForegroundColor Yellow
}
finally {
    if ($Word) {
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
    }
    [System.GC]::Collect()
}



