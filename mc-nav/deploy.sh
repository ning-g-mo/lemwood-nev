#!/bin/bash

# 部署脚本 - Bash版本
# 用于部署到lemwood.cn服务器

# 配置变量
SERVER_HOST=""
SERVER_USER=""
SERVER_PATH="/1p/1panel/apps/openresty/openresty/www/sites/lemwood.cn/index"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 开始部署到服务器...${NC}"

# 检查参数
if [ -z "$1" ] || [ -z "$2" ]; then
    echo -e "${RED}❌ 请提供服务器信息:${NC}"
    echo -e "${YELLOW}   ./deploy.sh <server-host> <server-user>${NC}"
    echo -e "${YELLOW}   例如: ./deploy.sh 192.168.1.100 root${NC}"
    exit 1
fi

SERVER_HOST=$1
SERVER_USER=$2

# 检查是否已构建
if [ ! -d "dist" ]; then
    echo -e "${YELLOW}📦 构建项目...${NC}"
    npm run build
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ 构建失败!${NC}"
        exit 1
    fi
fi

echo -e "${YELLOW}📁 创建服务器目录...${NC}"
# 首先在服务器上创建目录
ssh $SERVER_USER@$SERVER_HOST "mkdir -p $SERVER_PATH"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ 目录创建成功${NC}"
    
    echo -e "${YELLOW}📤 上传文件...${NC}"
    # 使用rsync上传文件
    rsync -avz --delete dist/ $SERVER_USER@$SERVER_HOST:$SERVER_PATH/
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}🎉 部署成功!${NC}"
        echo -e "${CYAN}🌐 网站地址: https://lemwood.cn${NC}"
    else
        echo -e "${RED}❌ 文件上传失败!${NC}"
        exit 1
    fi
else
    echo -e "${RED}❌ 目录创建失败!${NC}"
    exit 1
fi