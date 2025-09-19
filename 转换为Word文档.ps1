# PowerShell脚本：将HTML转换为Word文档
# 需要安装Microsoft Word或使用在线转换工具

# 方法1：如果您的电脑安装了Microsoft Word
function Convert-HtmlToWord {
    param(
        [string]$HtmlFile = "劳务派遣协议.html",
        [string]$WordFile = "劳务派遣协议.docx"
    )
    
    try {
        # 创建Word应用程序对象
        $Word = New-Object -ComObject Word.Application
        $Word.Visible = $false
        
        # 获取当前目录的完整路径
        $CurrentDir = Get-Location
        $HtmlPath = Join-Path $CurrentDir $HtmlFile
        $WordPath = Join-Path $CurrentDir $WordFile
        
        # 打开HTML文件
        $Doc = $Word.Documents.Open($HtmlPath)
        
        # 另存为Word文档
        $Doc.SaveAs2($WordPath, 16) # 16 = wdFormatDocumentDefault (docx格式)
        
        # 关闭文档和Word应用程序
        $Doc.Close()
        $Word.Quit()
        
        Write-Host "转换成功！Word文档已保存为：$WordFile" -ForegroundColor Green
    }
    catch {
        Write-Host "转换失败：$($_.Exception.Message)" -ForegroundColor Red
        Write-Host "请确保：" -ForegroundColor Yellow
        Write-Host "1. 已安装Microsoft Word" -ForegroundColor Yellow
        Write-Host "2. HTML文件存在于当前目录" -ForegroundColor Yellow
        Write-Host "3. 有足够的权限创建文件" -ForegroundColor Yellow
    }
    finally {
        # 确保释放COM对象
        if ($Word) {
            [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
        }
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
    }
}

# 执行转换
Write-Host "开始转换HTML文档到Word格式..." -ForegroundColor Cyan
Convert-HtmlToWord

Write-Host ""
Write-Host "============================================" -ForegroundColor Blue
Write-Host "转换说明：" -ForegroundColor Blue
Write-Host "============================================" -ForegroundColor Blue
Write-Host "如果上述自动转换失败，您可以手动转换：" -ForegroundColor White
Write-Host ""
Write-Host "方法1（推荐）：" -ForegroundColor Green
Write-Host "1. 在浏览器中打开'劳务派遣协议.html'文件" -ForegroundColor White
Write-Host "2. 按Ctrl+P打印" -ForegroundColor White
Write-Host "3. 选择'另存为PDF'或'Microsoft Print to PDF'" -ForegroundColor White
Write-Host "4. 然后在Word中打开PDF并另存为docx格式" -ForegroundColor White
Write-Host ""
Write-Host "方法2：" -ForegroundColor Green
Write-Host "1. 在浏览器中打开HTML文件" -ForegroundColor White
Write-Host "2. 全选内容(Ctrl+A)并复制(Ctrl+C)" -ForegroundColor White
Write-Host "3. 打开Microsoft Word，粘贴内容" -ForegroundColor White
Write-Host "4. 调整格式并保存为docx文件" -ForegroundColor White
Write-Host ""
Write-Host "方法3：" -ForegroundColor Green
Write-Host "使用在线转换工具，如：" -ForegroundColor White
Write-Host "- https://www.ilovepdf.com/zh-cn/html-to-word" -ForegroundColor White
Write-Host "- https://convertio.co/zh/html-docx/" -ForegroundColor White



