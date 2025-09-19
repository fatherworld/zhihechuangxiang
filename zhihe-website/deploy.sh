#!/bin/bash

# 深圳智核创享科技官网部署脚本
# 目标环境: cloud1-1gwbrgvee23be015

echo "🚀 开始部署深圳智核创享科技官网..."
echo "目标环境: cloud1-1gwbrgvee23be015"

# 检查文件是否存在
echo "📁 检查网站文件..."
if [ ! -f "index.html" ]; then
    echo "❌ 错误: index.html 文件不存在"
    exit 1
fi

if [ ! -f "styles.css" ]; then
    echo "❌ 错误: styles.css 文件不存在"
    exit 1
fi

if [ ! -f "script.js" ]; then
    echo "❌ 错误: script.js 文件不存在"
    exit 1
fi

echo "✅ 网站文件检查完成"

# 根据不同的部署环境选择方案
echo "请选择部署方式:"
echo "1) 云服务器 (SSH/SCP)"
echo "2) Docker容器"
echo "3) FTP上传"
echo "4) Git部署"
echo "5) 其他方式"

read -p "请输入选择 (1-5): " choice

case $choice in
    1)
        echo "🌐 准备SSH部署..."
        read -p "请输入服务器用户名: " username
        read -p "请输入服务器地址: " server_address
        read -p "请输入网站目录路径 (默认: /var/www/html): " web_path
        web_path=${web_path:-/var/www/html}
        
        echo "📤 开始上传文件..."
        scp -r * $username@$server_address:$web_path/
        echo "✅ 部署完成！"
        ;;
    2)
        echo "🐳 准备Docker部署..."
        echo "复制文件到容器 cloud1-1gwbrgvee23be015..."
        docker cp . cloud1-1gwbrgvee23be015:/usr/share/nginx/html/
        echo "✅ 部署完成！"
        ;;
    3)
        echo "📁 FTP部署说明："
        echo "请使用FTP客户端连接到环境 cloud1-1gwbrgvee23be015"
        echo "将以下文件上传到网站根目录："
        echo "- index.html"
        echo "- styles.css"
        echo "- script.js"
        ;;
    4)
        echo "📦 Git部署说明："
        echo "1. 将文件提交到Git仓库"
        echo "2. 在环境 cloud1-1gwbrgvee23be015 中执行:"
        echo "   git clone [仓库地址]"
        echo "   git pull origin main"
        ;;
    5)
        echo "📋 其他部署方式："
        echo "请根据云平台的具体要求进行部署"
        echo "常见方式:"
        echo "- 拖拽上传（如果是Web控制台）"
        echo "- API上传"
        echo "- CI/CD自动部署"
        ;;
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo ""
echo "🎉 部署脚本执行完成！"
echo "📱 网站预览: http://cloud1-1gwbrgvee23be015/"
echo "📞 技术支持: "
echo "   刘经理: 13522301938"
echo "   叶经理: 13693288380"
