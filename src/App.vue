<template>
  <div 
    :class="[
      'min-h-screen transition-all duration-500',
      getThemeClasses(),
      { 
        'minimal-light-mode': isMinimalMode && !isDarkMode,
        'minimal-dark-mode': isMinimalMode && isDarkMode
      }
    ]"
    :style="getBackgroundStyle()"
  >
    <!-- 统一顶栏 -->
    <header class="fixed top-0 left-0 right-0 z-50 p-4 md:p-6">
      <div class="glass-card mx-auto max-w-7xl">
        <div class="flex items-center justify-between px-4 py-3">
          <!-- 左侧：Logo 和标题 -->
          <router-link to="/" class="flex items-center space-x-3 link-hover">
            <img 
              src="/logo.png" 
              alt="Logo" 
              class="w-8 h-8 md:w-10 md:h-10 rounded-full"
            >
            <div class="hidden sm:block">
              <h1 class="text-lg md:text-xl font-bold gradient-text">柠枺</h1>
              <p class="text-xs text-gray-600 dark:text-gray-400 hidden md:block">个人主页</p>
            </div>
          </router-link>

          <!-- 右侧：功能按钮组 -->
          <div class="flex items-center space-x-2 md:space-x-3">
            <!-- 移动端汉堡菜单按钮 -->
            <div class="relative sm:hidden mobile-menu-container">
              <button
                @click="toggleMobileMenu"
                class="glass-card px-3 py-2 link-hover flex items-center justify-center"
                :title="'菜单'"
              >
                <svg class="w-5 h-5 text-gray-700 dark:text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
              </button>
              
              <!-- 移动端下拉菜单 -->
              <div 
                v-show="showMobileMenu"
                class="absolute right-0 top-full mt-2 w-48 glass-card border border-white/20 dark:border-white/10 rounded-xl shadow-xl z-50 backdrop-blur-xl bg-white/80 dark:bg-gray-800/80"
              >
                <div class="p-2 space-y-1">
                  <!-- 导航菜单 -->
                  <div class="border-b border-gray-300/30 dark:border-gray-600/30 pb-2 mb-2">
                    <p class="text-xs font-semibold text-gray-500 dark:text-gray-400 px-3 py-1">页面导航</p>
                    <router-link
                      to="/"
                      @click="closeMobileMenu"
                      class="flex items-center space-x-3 px-3 py-2 rounded-lg hover:bg-white/10 dark:hover:bg-black/20 transition-colors"
                      :class="{ 'bg-blue-500/20': $route.path === '/' }"
                    >
                      <svg class="w-4 h-4 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                      </svg>
                      <span class="text-sm font-medium text-gray-700 dark:text-gray-300">主页</span>
                    </router-link>
                    <router-link
                      to="/projects"
                      @click="closeMobileMenu"
                      class="flex items-center space-x-3 px-3 py-2 rounded-lg hover:bg-white/10 dark:hover:bg-black/20 transition-colors"
                      :class="{ 'bg-purple-500/20': $route.path === '/projects' }"
                    >
                      <svg class="w-4 h-4 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                      </svg>
                      <span class="text-sm font-medium text-gray-700 dark:text-gray-300">项目展示</span>
                    </router-link>
                    <router-link
                      to="/blog"
                      @click="closeMobileMenu"
                      class="flex items-center space-x-3 px-3 py-2 rounded-lg hover:bg-white/10 dark:hover:bg-black/20 transition-colors"
                      :class="{ 'bg-orange-500/20': $route.path.startsWith('/blog') }"
                    >
                      <svg class="w-4 h-4 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                      </svg>
                      <span class="text-sm font-medium text-gray-700 dark:text-gray-300">博客文章</span>
                    </router-link>
                  </div>
                  
                  <!-- 功能设置 -->
                  <div>
                    <p class="text-xs font-semibold text-gray-500 dark:text-gray-400 px-3 py-1">主题设置</p>
                    <button
                      @click="toggleBackgroundMode"
                      class="flex items-center space-x-3 px-3 py-2 rounded-lg hover:bg-white/10 dark:hover:bg-black/20 transition-colors w-full text-left"
                    >
                      <svg v-if="!isMinimalMode" class="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                      </svg>
                      <svg v-else class="w-4 h-4 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                      </svg>
                      <span class="text-sm font-medium text-gray-700 dark:text-gray-300">{{ isMinimalMode ? '显示背景图' : '隐藏背景图' }}</span>
                    </button>
                    <button
                      @click="toggleDarkMode"
                      class="flex items-center space-x-3 px-3 py-2 rounded-lg hover:bg-white/10 dark:hover:bg-black/20 transition-colors w-full text-left"
                    >
                      <svg v-if="!isDarkMode" class="w-4 h-4 text-yellow-500" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
                      </svg>
                      <svg v-else class="w-4 h-4 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                      </svg>
                      <span class="text-sm font-medium text-gray-700 dark:text-gray-300">{{ isDarkMode ? '切换到亮色' : '切换到暗色' }}</span>
                    </button>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 桌面端按钮组 -->
            <!-- 主页按钮 -->
            <router-link
              to="/"
              class="glass-card px-3 py-2 md:px-4 md:py-3 link-hover group relative flex items-center space-x-2 hidden sm:flex"
              :class="{ 'bg-blue-500/20': $route.path === '/' }"
            >
              <svg class="w-4 h-4 md:w-5 md:h-5 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
              </svg>
              
              <!-- 按钮文字 -->
              <span class="text-sm font-medium text-gray-700 dark:text-gray-300 hidden sm:block">
                主页
              </span>
            </router-link>

            <!-- 项目按钮 -->
            <router-link
              to="/projects"
              class="glass-card px-3 py-2 md:px-4 md:py-3 link-hover group relative flex items-center space-x-2 hidden sm:flex"
              :class="{ 'bg-purple-500/20': $route.path === '/projects' }"
            >
              <svg class="w-4 h-4 md:w-5 md:h-5 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
              </svg>
              
              <!-- 按钮文字 -->
              <span class="text-sm font-medium text-gray-700 dark:text-gray-300 hidden sm:block">
                项目
              </span>
            </router-link>

            <!-- 博客按钮 -->
            <router-link
              to="/blog"
              class="glass-card px-3 py-2 md:px-4 md:py-3 link-hover group relative flex items-center space-x-2 hidden sm:flex"
              :class="{ 'bg-orange-500/20': $route.path.startsWith('/blog') }"
            >
              <svg class="w-4 h-4 md:w-5 md:h-5 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
              </svg>
              
              <!-- 按钮文字 -->
              <span class="text-sm font-medium text-gray-700 dark:text-gray-300 hidden sm:block">
                博客
              </span>
            </router-link>

            <!-- 分隔线 -->
            <div class="w-px h-6 bg-gray-300 dark:bg-gray-600 hidden sm:block"></div>

            <!-- 无图模式切换按钮 -->
            <button
              @click="toggleBackgroundMode"
              class="glass-card px-3 py-2 md:px-4 md:py-3 link-hover group relative flex items-center space-x-2 hidden sm:flex"
              :title="getBackgroundModeTooltip()"
            >
              <!-- 有背景图标 -->
              <svg v-if="!isMinimalMode" class="w-4 h-4 md:w-5 md:h-5 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
              </svg>
              <!-- 无图图标 -->
              <svg v-else class="w-4 h-4 md:w-5 md:h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
              </svg>
              
              <!-- 按钮文字 -->
              <span class="text-sm font-medium text-gray-700 dark:text-gray-300 hidden lg:block">
                {{ isMinimalMode ? '显示背景' : '隐藏背景' }}
              </span>
            </button>

            <!-- 暗色模式切换按钮 -->
            <button
              @click="toggleDarkMode"
              class="glass-card px-3 py-2 md:px-4 md:py-3 link-hover group relative flex items-center space-x-2 hidden sm:flex"
              :title="getDarkModeTooltip()"
            >
              <!-- 亮色主题图标 -->
              <svg v-if="!isDarkMode" class="w-4 h-4 md:w-5 md:h-5 text-yellow-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
              </svg>
              <!-- 暗色主题图标 -->
              <svg v-else class="w-4 h-4 md:w-5 md:h-5 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
              </svg>
              
              <!-- 按钮文字 -->
              <span class="text-sm font-medium text-gray-700 dark:text-gray-300 hidden lg:block">
                {{ isDarkMode ? '亮色' : '暗色' }}
              </span>
            </button>
          </div>
        </div>
      </div>
    </header>

    <!-- 主要内容区域 -->
    <main class="flex-1 container mx-auto px-4 py-8 pt-24 md:pt-28">
      <router-view />
    </main>

    <!-- 页脚 -->
    <footer class="text-center py-8 mt-16">
      <div class="glass-card max-w-md mx-auto p-6">
        <!-- 友情链接 -->
        <div class="mb-4 pb-4 border-b border-gray-300/30 dark:border-gray-600/30">
          <h3 class="text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">友情链接</h3>
          <div class="flex justify-center flex-wrap gap-2">
            <a href="https://mengze.vip" target="_blank" 
               class="inline-flex items-center px-3 py-2 text-sm text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300 transition-colors duration-200 hover:underline rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900/20">
              <img src="https://cdn.zeart.ink/gh/YShenZe/Blog-Static-Resource@main/images/202508091754715429589-27c40fedf962afbafbf31a7a06cd137b.jpg" 
                   alt="梦泽头像" 
                   class="w-6 h-6 rounded-full mr-2 border border-gray-200 dark:border-gray-600"
                   loading="lazy">
              梦泽
            </a>
            <a href="https://lovekogasa.lapis-net.top" target="_blank" 
               class="inline-flex items-center px-3 py-2 text-sm text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300 transition-colors duration-200 hover:underline rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900/20">
              <img src="https://lovekogasa.lapis-net.top/avatar/avatar.jpg" 
                   alt="Love-kogasa头像" 
                   class="w-6 h-6 rounded-full mr-2 border border-gray-200 dark:border-gray-600"
                   loading="lazy">
              Love-kogasa
            </a>
            <a href="https://github.com/XiaoluoFoxington" target="_blank" 
               class="inline-flex items-center px-3 py-2 text-sm text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300 transition-colors duration-200 hover:underline rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900/20">
              <img src="https://cdn.mengze.vip/gh/XiaoluoFoxington/FCL.website.mdui/file/avatar/XiaoluoFoxington.webp" 
                   alt="洛狐XiaoluoFoxington头像" 
                   class="w-6 h-6 rounded-full mr-2 border border-gray-200 dark:border-gray-600"
                   loading="lazy">
              洛狐XiaoluoFoxington
            </a>
            <a href="https://mcisee.top/" target="_blank" 
               class="inline-flex items-center px-3 py-2 text-sm text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300 transition-colors duration-200 hover:underline rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900/20">
              <img src="/icons/mcisee.png" 
                   alt="mcisee图标" 
                   class="w-6 h-6 rounded-full mr-2 border border-gray-200 dark:border-gray-600"
                   loading="lazy">
              mcisee
            </a>
          </div>
        </div>
        
        <p class="text-gray-600 dark:text-gray-400">
          © 2025 柠枺的个人主页
        </p>
        <p class="text-sm text-gray-500 dark:text-gray-500 mt-2">
          Made with ❤️ and AI
        </p>
        <p class="text-xs text-gray-500 dark:text-gray-500 mt-2">
          <a href="https://beian.miit.gov.cn/" target="_blank" class="hover:text-gray-400 transition-colors">
            新ICP备2024015133号-3
          </a>
        </p>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

// 分离的主题状态：无图模式和暗色模式
const isMinimalMode = ref(true) // 默认为无图模式
const isDarkMode = ref(false)   // 默认为亮色
const showMobileMenu = ref(false) // 移动端菜单状态

// 移动端菜单控制
const toggleMobileMenu = () => {
  showMobileMenu.value = !showMobileMenu.value
}

const closeMobileMenu = () => {
  showMobileMenu.value = false
}

// 点击空白处关闭菜单
const handleClickOutside = (event) => {
  const mobileMenuButton = event.target.closest('.mobile-menu-container')
  if (!mobileMenuButton && showMobileMenu.value) {
    closeMobileMenu()
  }
}

// 背景模式切换
const toggleBackgroundMode = () => {
  isMinimalMode.value = !isMinimalMode.value
  saveThemeSettings()
}

// 暗色模式切换
const toggleDarkMode = () => {
  isDarkMode.value = !isDarkMode.value
  saveThemeSettings()
}

// 保存主题设置到本地存储
const saveThemeSettings = () => {
  localStorage.setItem('isMinimalMode', isMinimalMode.value.toString())
  localStorage.setItem('isDarkMode', isDarkMode.value.toString())
}

// 获取主题CSS类
const getThemeClasses = () => {
  if (isMinimalMode.value) {
    // 无图模式
    return isDarkMode.value ? 'dark bg-gray-900' : 'bg-gray-50'
  } else {
    // 有背景图模式
    return isDarkMode.value 
      ? 'dark bg-dark-bg bg-cover bg-center bg-fixed'
      : 'bg-light-bg bg-cover bg-center bg-fixed'
  }
}

// 获取背景样式
const getBackgroundStyle = () => {
  return {}
}

// 获取背景模式提示文字
const getBackgroundModeTooltip = () => {
  return isMinimalMode.value 
    ? '当前：无图模式 → 点击切换到背景图模式'
    : '当前：背景图模式 → 点击切换到无图模式'
}

// 获取暗色模式提示文字
const getDarkModeTooltip = () => {
  return isDarkMode.value 
    ? '当前：暗色主题 → 点击切换到亮色主题'
    : '当前：亮色主题 → 点击切换到暗色主题'
}

onMounted(() => {
  // 从本地存储加载主题设置
  const savedMinimalMode = localStorage.getItem('isMinimalMode')
  const savedDarkMode = localStorage.getItem('isDarkMode')
  
  if (savedMinimalMode !== null) {
    isMinimalMode.value = savedMinimalMode === 'true'
  }
  
  if (savedDarkMode !== null) {
    isDarkMode.value = savedDarkMode === 'true'
  }
  
  
  // 如果没有保存的设置，使用默认值（无图白色模式）
  if (savedMinimalMode === null && savedDarkMode === null) {
    saveThemeSettings()
  }
  
  // 添加点击空白处关闭菜单的事件监听器
  document.addEventListener('click', handleClickOutside)
})

onUnmounted(() => {
  // 清理事件监听器
  document.removeEventListener('click', handleClickOutside)
})
</script>