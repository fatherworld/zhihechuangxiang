# PowerShell脚本：转换员工劳务派遣协议为Word文档

$HtmlFile = "员工劳务派遣协议.html"
$WordFile = "员工劳务派遣协议_可编辑版.docx"

Write-Host "正在转换员工劳务派遣协议..." -ForegroundColor Cyan

try {
    # 创建Word应用程序对象
    $Word = New-Object -ComObject Word.Application
    $Word.Visible = $false
    
    # 获取完整路径
    $CurrentDir = Get-Location
    $HtmlPath = Join-Path $CurrentDir $HtmlFile
    $WordPath = Join-Path $CurrentDir $WordFile
    
    Write-Host "正在打开HTML文件: $HtmlPath"
    
    # 打开HTML文档
    $Doc = $Word.Documents.Open($HtmlPath)
    
    Write-Host "正在转换为Word格式..."
    
    # 保存为Word文档（.docx格式）
    $Doc.SaveAs2($WordPath, 16) # 16 = wdFormatDocumentDefault
    
    # 关闭文档和应用程序
    $Doc.Close()
    $Word.Quit()
    
    Write-Host "✅ 转换成功！" -ForegroundColor Green
    Write-Host "📄 员工劳务派遣协议已保存为: $WordFile" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 合同特点（甲方有利条款）：" -ForegroundColor Yellow
    Write-Host "1. 社保按最低标准缴纳，不含公积金" -ForegroundColor White
    Write-Host "2. 灵活的工作调整和退回机制" -ForegroundColor White
    Write-Host "3. 严格的违约和保密条款" -ForegroundColor White
    Write-Host "4. 用工单位退回时自动终止协议" -ForegroundColor White
    Write-Host "5. 甲方享有工资调整权" -ForegroundColor White
    
} catch {
    Write-Host "❌ 转换失败: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 备选方案：" -ForegroundColor Yellow
    Write-Host "1. 用浏览器打开'员工劳务派遣协议.html'文件" -ForegroundColor White
    Write-Host "2. 按Ctrl+P打印，选择'另存为PDF'" -ForegroundColor White
    Write-Host "3. 在Word中打开PDF并另存为docx格式" -ForegroundColor White
} finally {
    # 确保释放COM对象
    if ($Word) {
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
    }
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}



