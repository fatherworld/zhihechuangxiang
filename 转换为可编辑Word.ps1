# PowerShell脚本：将可编辑HTML转换为Word文档
# 这个版本专门处理包含输入框的HTML

$HtmlFile = "劳务派遣协议.html"
$WordFile = "劳务派遣协议_可编辑版.docx"

Write-Host "正在转换可编辑版本的劳务派遣协议..." -ForegroundColor Cyan

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
    Write-Host "📄 可编辑Word文档已保存为: $WordFile" -ForegroundColor Green
    Write-Host ""
    Write-Host "📝 使用说明：" -ForegroundColor Yellow
    Write-Host "1. 打开生成的Word文档" -ForegroundColor White
    Write-Host "2. 所有之前是横线的地方现在都是可编辑的文本框" -ForegroundColor White
    Write-Host "3. 直接点击文本框即可输入内容" -ForegroundColor White
    Write-Host "4. 表格中的单元格也可以直接编辑" -ForegroundColor White
    Write-Host "5. 签名区域也变成了可编辑的文本框" -ForegroundColor White
    
} catch {
    Write-Host "❌ 转换失败: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 备选方案：" -ForegroundColor Yellow
    Write-Host "1. 用浏览器打开'劳务派遣协议.html'文件" -ForegroundColor White
    Write-Host "2. 在浏览器中填写所有信息" -ForegroundColor White
    Write-Host "3. 按Ctrl+P打印，选择'另存为PDF'" -ForegroundColor White
    Write-Host "4. 在Word中打开PDF并另存为docx格式" -ForegroundColor White
    Write-Host ""
    Write-Host "🌐 在线转换工具：" -ForegroundColor Yellow
    Write-Host "- https://www.ilovepdf.com/zh-cn/html-to-word" -ForegroundColor White
    Write-Host "- https://convertio.co/zh/html-docx/" -ForegroundColor White
} finally {
    # 确保释放COM对象
    if ($Word) {
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
    }
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}



