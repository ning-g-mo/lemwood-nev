# 柠枺的个人主页

一个使用 Vue 3 + Vite + Tailwind CSS 构建的现代化个人主页。

## 特性

- 🌓 暗色/亮色主题切换
- 📱 响应式设计
- ✨ 流畅的动画效果
- 🎨 毛玻璃效果卡片
- 🖼️ 动态背景图片

## 技术栈

- Vue 3
- Vite
- Tailwind CSS
- JavaScript

## 快速开始

1. 安装依赖：
```bash
npm install
```

2. 启动开发服务器：
```bash
npm run dev
```

3. 构建生产版本：
```bash
npm run build
```

4. 预览生产版本：
```bash
npm run preview
```

## 项目结构

```
├── public/                 # 静态资源
│   ├── bg-dark.jpg        # 暗色主题背景图
│   ├── bg-light.jpg       # 亮色主题背景图
│   ├── logo.png           # 网站图标
│   └── icons/             # 项目图标
├── src/
│   ├── App.vue            # 主组件
│   ├── main.js            # 入口文件
│   └── style.css          # 全局样式
├── index.html             # HTML 模板
├── package.json           # 项目配置
├── vite.config.js         # Vite 配置
└── tailwind.config.js     # Tailwind 配置
```

## 自定义

- 修改 `src/App.vue` 中的个人信息
- 替换 `public/` 目录下的图片资源
- 调整 `tailwind.config.js` 中的主题配置

## 部署

项目构建后会生成 `dist` 目录，可以部署到任何静态网站托管服务。