# 部署指南

## 📋 准备工作

你的项目已经构建完成并准备推送到GitHub！

## 🚀 GitHub部署步骤

### 1. 创建GitHub仓库

1. 访问 [GitHub](https://github.com)
2. 点击右上角的 "+" 按钮，选择 "New repository"
3. 仓库名称设置为：`mc-nav`
4. 设置为 Public（如果要使用GitHub Pages）
5. **不要**勾选 "Add a README file"、"Add .gitignore" 或 "Choose a license"
6. 点击 "Create repository"

### 2. 推送代码到GitHub

创建仓库后，在你的项目目录中运行：

```bash
# 如果远程仓库地址不正确，先移除再重新添加
git remote remove origin
git remote add origin https://github.com/ning-g-mo/mc-nav.git

# 推送代码
git push -u origin main
```

### 3. 启用GitHub Pages

1. 在GitHub仓库页面，点击 "Settings" 标签
2. 在左侧菜单中找到 "Pages"
3. 在 "Source" 部分选择 "GitHub Actions"
4. 保存设置

### 4. 自动部署

- 每次推送到 `main` 分支时，GitHub Actions 会自动：
  - 安装依赖
  - 构建项目
  - 部署到GitHub Pages

- 部署完成后，你的网站将在以下地址可用：
  `https://ning-g-mo.github.io/mc-nav/`

## 🔧 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 构建生产版本
npm run build

# 预览生产版本
npm run preview
```

## 📁 项目结构

```
mc-nav/
├── .github/workflows/    # GitHub Actions配置
├── public/              # 静态资源
├── src/                 # 源代码
├── dist/               # 构建输出（自动生成）
├── package.json        # 项目配置
└── README.md          # 项目说明
```

## 🎯 下一步

1. 创建GitHub仓库
2. 推送代码
3. 启用GitHub Pages
4. 等待自动部署完成
5. 访问你的个人主页！

## 🛠️ 自定义

- 修改个人信息：编辑 `src/App.vue`
- 更换图片：替换 `public/` 目录下的文件
- 调整样式：修改 `src/style.css` 或 `tailwind.config.js`