# 深圳智核创享科技官网

## 📁 文件说明
- `index.html` - 网站主页
- `styles.css` - 样式文件  
- `script.js` - 交互脚本
- `部署说明.md` - 详细部署指南

## 🚀 快速部署到环境 cloud1-1gwbrgvee23be015

### 可能的云平台类型：

#### 1. 如果是阿里云/腾讯云等云服务器：
```bash
# 使用SCP上传文件
scp -r zhihe-website/* user@cloud1-1gwbrgvee23be015:/var/www/html/

# 或使用rsync
rsync -avz zhihe-website/ user@cloud1-1gwbrgvee23be015:/var/www/html/
```

#### 2. 如果是Docker容器：
```bash
# 复制到容器
docker cp zhihe-website/. cloud1-1gwbrgvee23be015:/usr/share/nginx/html/

# 或挂载目录
docker run -d -p 80:80 -v $(pwd)/zhihe-website:/usr/share/nginx/html --name cloud1-1gwbrgvee23be015 nginx
```

#### 3. 如果是云IDE环境（如Cloud9、CodeSandbox等）：
- 直接拖拽文件到workspace
- 或使用git上传

#### 4. 如果是云函数/Serverless平台：
需要按平台要求打包上传

## 📞 联系方式
- 刘经理：13522301938
- 叶经理：13693288380

## 🔧 技术支持
如需协助部署，请联系技术人员。
