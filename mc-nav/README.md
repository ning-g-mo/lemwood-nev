# MC-Nav: Minecraft 导航网站

一个美观、简洁的 Minecraft 相关资源导航网站。

## 特点

- 🌓 明暗主题切换
- 🔍 内置搜索功能
- 🎨 毛玻璃界面设计
- 📱 响应式布局 (桌面端和移动端)
- 🖼️ 自定义背景图片
- 🔧 易于定制的导航链接
- 🏷️ 支持emoji和图片图标

## 快速开始

```bash
# 安装依赖
npm install

# 开发模式启动
npm run dev

# 构建生产版本
npm run build
```

## 自定义内容

### 导航链接

编辑 `src/App.vue` 中的 `links` 数组来自定义导航分类和链接。

```javascript
const links = ref([
  {
    category: '分类名称', // 分类标题
    icon: '⚙️',         // 分类图标 (可以是emoji或图片URL)
    items: [
      { name: '链接名称', url: '/链接地址', icon: '📘' }, // 链接项 (图标可以是emoji或图片URL)
      { name: '图片图标示例', url: '/示例链接', icon: '/icons/example.png' } // 使用图片作为图标
    ]
  },
  // 更多分类...
]);
```

### 图标支持

MC-Nav 支持两种类型的图标:

1. **Emoji 图标**: 直接使用 emoji 字符，如 `'🌐'`、`'📘'` 等
2. **图片图标**: 使用图片的URL路径，如 `/icons/example.png`

图片图标建议:
- 将图片放在 `public/icons/` 目录下
- 使用透明背景的图片 (PNG 或 SVG 格式)
- 推荐尺寸为 32x32 或 64x64 像素

### 背景图片

替换 `public/` 目录中的以下文件:

- `bg-light.jpg`: 浅色主题背景图
- `bg-dark.jpg`: 深色主题背景图

## ICP备案信息

网站底部显示的ICP备案信息可以在 `App.vue` 文件中的 `icp-footer` 部分修改。

## 技术栈

- Vue 3
- Vite
- Naive UI
- VueUse
