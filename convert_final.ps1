# Convert final contract to Word
$HtmlFile = "员工劳务派遣协议.html"
$WordFile = "深圳智核创享员工劳动合同.docx"

try {
    $Word = New-Object -ComObject Word.Application
    $Word.Visible = $false
    
    $CurrentDir = Get-Location
    $HtmlPath = Join-Path $CurrentDir $HtmlFile
    $WordPath = Join-Path $CurrentDir $WordFile
    
    $Doc = $Word.Documents.Open($HtmlPath)
    $Doc.SaveAs2($WordPath, 16)
    
    $Doc.Close()
    $Word.Quit()
    
    Write-Host "Success! Created: $WordFile" -ForegroundColor Green
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Manual conversion: Open HTML in browser, save as PDF, then convert to Word" -ForegroundColor Yellow
}
finally {
    if ($Word) {
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
    }
    [System.GC]::Collect()
}



