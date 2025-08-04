# 部署脚本 - PowerShell版本
# 用于部署到lemwood.cn服务器

param(
    [string]$ServerHost = "",
    [string]$ServerUser = "",
    [string]$ServerPath = "/1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/index"
)

Write-Host "🚀 开始部署到服务器..." -ForegroundColor Green

# 检查是否已构建
if (-not (Test-Path "dist")) {
    Write-Host "📦 构建项目..." -ForegroundColor Yellow
    npm run build
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 构建失败!" -ForegroundColor Red
        exit 1
    }
}

# 检查参数
if ([string]::IsNullOrEmpty($ServerHost) -or [string]::IsNullOrEmpty($ServerUser)) {
    Write-Host "❌ 请提供服务器信息:" -ForegroundColor Red
    Write-Host "   .\deploy.ps1 -ServerHost 'your-server-ip' -ServerUser 'your-username'" -ForegroundColor Yellow
    exit 1
}

Write-Host "📁 创建服务器目录..." -ForegroundColor Yellow
# 首先在服务器上创建目录
$createDirCommand = "ssh $ServerUser@$ServerHost 'mkdir -p $ServerPath'"
Write-Host "执行: $createDirCommand" -ForegroundColor Cyan
Invoke-Expression $createDirCommand

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ 目录创建成功" -ForegroundColor Green
    
    Write-Host "📤 上传文件..." -ForegroundColor Yellow
    # 使用rsync上传文件
    $rsyncCommand = "rsync -avz --delete dist/ $ServerUser@$ServerHost`:$ServerPath/"
    Write-Host "执行: $rsyncCommand" -ForegroundColor Cyan
    Invoke-Expression $rsyncCommand
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "🎉 部署成功!" -ForegroundColor Green
        Write-Host "🌐 网站地址: https://lemwood.cn" -ForegroundColor Cyan
    } else {
        Write-Host "❌ 文件上传失败!" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "❌ 目录创建失败!" -ForegroundColor Red
    exit 1
}