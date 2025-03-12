图标文件夹说明
===========

这个文件夹用于存放导航链接的图标图片。

使用指南:
1. 将图标图片 (.png, .jpg, .svg 等) 放在此文件夹中
2. 在导航数据中引用图标时使用路径: `/icons/你的图标文件名.png`

建议:
- 图标尺寸建议使用 32x32 或 64x64 像素的正方形图片
- 图标应该有透明背景 (PNG/SVG 格式)
- 文件名中避免使用空格和特殊字符

示例:
在 App.vue 中的链接数据这样使用:
```javascript
{
  name: '我的网站',
  url: 'https://example.com',
  icon: '/icons/website-icon.png'  // 使用图片图标
}
```

或者使用emoji:
```javascript
{
  name: '我的网站',
  url: 'https://example.com',
  icon: '🌐'  // 使用emoji图标
}
``` 