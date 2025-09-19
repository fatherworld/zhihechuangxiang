@echo off
echo.
echo =====================================================
echo    深圳智核创享科技官网部署工具 (Windows版)
echo    目标环境: cloud1-1gwbrgvee23be015
echo =====================================================
echo.

REM 检查文件是否存在
echo 📁 检查网站文件...
if not exist "index.html" (
    echo ❌ 错误: index.html 文件不存在
    pause
    exit /b 1
)

if not exist "styles.css" (
    echo ❌ 错误: styles.css 文件不存在
    pause
    exit /b 1
)

if not exist "script.js" (
    echo ❌ 错误: script.js 文件不存在
    pause
    exit /b 1
)

echo ✅ 网站文件检查完成
echo.

echo 请选择部署方式:
echo 1^) 云服务器 ^(SCP/SFTP^)
echo 2^) FTP上传
echo 3^) 打包为ZIP文件
echo 4^) 创建Git仓库
echo 5^) 打开文件夹 ^(手动上传^)
echo.

set /p choice="请输入选择 (1-5): "

if "%choice%"=="1" goto ssh_deploy
if "%choice%"=="2" goto ftp_deploy  
if "%choice%"=="3" goto zip_deploy
if "%choice%"=="4" goto git_deploy
if "%choice%"=="5" goto manual_deploy
goto invalid_choice

:ssh_deploy
echo.
echo 🌐 SSH/SCP部署说明:
echo 请使用以下工具之一:
echo - WinSCP: https://winscp.net/
echo - PuTTY + PSCP
echo - Git Bash
echo.
echo 连接信息:
echo 主机: cloud1-1gwbrgvee23be015
echo 目标目录: /var/www/html/ 或网站根目录
echo.
echo 上传以下文件:
echo - index.html
echo - styles.css  
echo - script.js
pause
goto end

:ftp_deploy
echo.
echo 📁 FTP部署说明:
echo 请使用FTP客户端（如FileZilla）连接到:
echo 主机: cloud1-1gwbrgvee23be015
echo.
echo 上传以下文件到网站根目录:
echo - index.html
echo - styles.css
echo - script.js
pause
goto end

:zip_deploy
echo.
echo 📦 正在创建部署包...
powershell Compress-Archive -Path "index.html","styles.css","script.js" -DestinationPath "zhihe-website-deploy.zip" -Force
if exist "zhihe-website-deploy.zip" (
    echo ✅ 部署包创建成功: zhihe-website-deploy.zip
    echo 请将此ZIP文件上传到环境 cloud1-1gwbrgvee23be015 并解压
) else (
    echo ❌ 部署包创建失败
)
pause
goto end

:git_deploy
echo.
echo 📦 Git部署说明:
echo 1. 初始化Git仓库: git init
echo 2. 添加文件: git add .
echo 3. 提交: git commit -m "初始提交"
echo 4. 添加远程仓库: git remote add origin [仓库地址]
echo 5. 推送: git push -u origin main
echo.
echo 然后在环境 cloud1-1gwbrgvee23be015 中执行:
echo git clone [仓库地址]
pause
goto end

:manual_deploy
echo.
echo 📂 打开文件夹进行手动上传...
explorer .
echo.
echo 请手动将以下文件上传到环境 cloud1-1gwbrgvee23be015:
echo - index.html
echo - styles.css
echo - script.js
pause
goto end

:invalid_choice
echo ❌ 无效选择
pause
goto end

:end
echo.
echo =====================================================
echo 🎉 部署工具使用完成！
echo 📱 网站预览: http://cloud1-1gwbrgvee23be015/
echo 📞 技术支持: 
echo    刘经理: 13522301938
echo    叶经理: 13693288380
echo =====================================================
pause
