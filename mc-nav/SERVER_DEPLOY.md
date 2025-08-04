# 服务器部署指南

## 🚨 问题解决

你遇到的错误：
```
rsync: [Receiver] mkdir "/1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/index" failed: No such file or directory (2)
```

**原因**: 服务器上的目标目录不存在。

## 🛠️ 解决方案

### 方法1: 使用自动部署脚本

我已经为你创建了两个部署脚本，它们会自动创建目录然后上传文件：

#### PowerShell版本 (Windows推荐)
```powershell
.\deploy.ps1 -ServerHost "你的服务器IP" -ServerUser "你的用户名"
```

#### Bash版本 (Linux/Mac/WSL)
```bash
chmod +x deploy.sh
./deploy.sh 你的服务器IP 你的用户名
```

### 方法2: 手动创建目录

1. **先在服务器上创建目录**:
```bash
ssh 用户名@服务器IP "mkdir -p /1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/index"
```

2. **然后上传文件**:
```bash
rsync -avz --delete dist/ 用户名@服务器IP:/1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/index/
```

### 方法3: 修改目标路径

如果你想部署到网站根目录而不是index子目录，可以修改路径：

```bash
# 部署到根目录
rsync -avz --delete dist/ 用户名@服务器IP:/1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/
```

## 📋 部署前检查清单

- [ ] 确保项目已构建 (`npm run build`)
- [ ] 确保有服务器SSH访问权限
- [ ] 确认服务器路径是否正确
- [ ] 检查服务器磁盘空间是否足够

## 🔧 常见问题

### 1. SSH连接问题
```bash
# 测试SSH连接
ssh 用户名@服务器IP "echo 'SSH连接成功'"
```

### 2. 权限问题
```bash
# 检查目录权限
ssh 用户名@服务器IP "ls -la /1p/1panel/apps/openresty/openresty/www/sites/"
```

### 3. 路径不存在
```bash
# 创建完整路径
ssh 用户名@服务器IP "mkdir -p /1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/index"
```

## 🚀 推荐部署流程

1. **构建项目**:
```bash
npm run build
```

2. **使用部署脚本**:
```powershell
# Windows PowerShell
.\deploy.ps1 -ServerHost "你的IP" -ServerUser "用户名"
```

3. **验证部署**:
访问 https://lemwood.cn 检查网站是否正常运行

## 📝 注意事项

- 确保服务器上的nginx/openresty配置正确指向部署目录
- 建议在部署前备份现有文件
- 如果是首次部署，可能需要配置SSL证书和域名解析