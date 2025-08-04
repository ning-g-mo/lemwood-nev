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
          <div class="flex items-center space-x-3">
            <img 
              src="/logo.png" 
              alt="Logo" 
              class="w-8 h-8 md:w-10 md:h-10 rounded-full"
            >
            <div class="hidden sm:block">
              <h1 class="text-lg md:text-xl font-bold gradient-text">柠枺</h1>
              <p class="text-xs text-gray-600 dark:text-gray-400 hidden md:block">个人主页</p>
            </div>
          </div>

          <!-- 右侧：功能按钮组 -->
          <div class="flex items-center space-x-2 md:space-x-3">
            <!-- 页面切换按钮 -->
            <button
              @click="togglePage"
              class="glass-card p-2 md:p-3 link-hover group relative"
              :title="getPageTooltip()"
            >
              <!-- 主页图标 -->
              <svg v-if="currentPage === 'projects'" class="w-5 h-5 md:w-6 md:h-6 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
              </svg>
              <!-- 项目图标 -->
              <svg v-else class="w-5 h-5 md:w-6 md:h-6 text-purple-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
              </svg>
              
              <!-- 桌面端提示文字 -->
              <span class="absolute top-full left-1/2 transform -translate-x-1/2 mt-2 text-xs bg-black/80 text-white px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap hidden md:block">
                {{ getPageTooltip() }}
              </span>
            </button>

            <!-- 分隔线 -->
            <div class="w-px h-6 bg-gray-300 dark:bg-gray-600 hidden sm:block"></div>

            <!-- 无图模式切换按钮 -->
            <button
              @click="toggleBackgroundMode"
              class="glass-card p-2 md:p-3 link-hover group relative"
              :title="getBackgroundModeTooltip()"
            >
              <!-- 有背景图标 -->
              <svg v-if="!isMinimalMode" class="w-5 h-5 md:w-6 md:h-6 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
              </svg>
              <!-- 无图图标 -->
              <svg v-else class="w-5 h-5 md:w-6 md:h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
              </svg>
              
              <!-- 桌面端提示文字 -->
              <span class="absolute top-full left-1/2 transform -translate-x-1/2 mt-2 text-xs bg-black/80 text-white px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap hidden md:block">
                {{ getBackgroundModeTooltip() }}
              </span>
            </button>

            <!-- 暗色模式切换按钮 -->
            <button
              @click="toggleDarkMode"
              class="glass-card p-2 md:p-3 link-hover group relative"
              :title="getDarkModeTooltip()"
            >
              <!-- 亮色主题图标 -->
              <svg v-if="!isDarkMode" class="w-5 h-5 md:w-6 md:h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
              </svg>
              <!-- 暗色主题图标 -->
              <svg v-else class="w-5 h-5 md:w-6 md:h-6 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
              </svg>
              
              <!-- 桌面端提示文字 -->
              <span class="absolute top-full left-1/2 transform -translate-x-1/2 mt-2 text-xs bg-black/80 text-white px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap hidden md:block">
                {{ getDarkModeTooltip() }}
              </span>
            </button>
          </div>
        </div>
      </div>
    </header>

    <!-- 主要内容 -->
    <div class="container mx-auto px-4 pt-24 md:pt-28 pb-8">
      <!-- 主页内容 -->
      <div v-if="currentPage === 'home'" class="animate-fade-in">
        <!-- 头部区域 -->
        <header class="text-center mb-12 animate-fade-in">
          <div class="mb-8">
            <img 
              src="/logo.png" 
              alt="Logo" 
              class="w-24 h-24 mx-auto rounded-full shadow-2xl animate-float"
            >
          </div>
          
          <h1 class="text-5xl md:text-7xl font-bold mb-4 gradient-text animate-slide-up">
            柠枺
          </h1>
          
          <p class="text-xl md:text-2xl text-gray-700 dark:text-gray-300 mb-6 animate-slide-up italic">
            "世界源于灵活的幻想"
          </p>
        </header>

        <!-- 简介卡片 -->
        <section class="max-w-4xl mx-auto mb-12 animate-slide-up">
          <div class="glass-card p-8 md:p-12">
            <h2 class="text-3xl font-bold mb-6 text-gray-800 dark:text-white">
              关于我
            </h2>
            <p class="text-lg leading-relaxed text-gray-700 dark:text-gray-300">
              大家好，我是柠枺，这里是我的主页。本人并不会什么语言，也不是什么大佬，我只会运用AI来完成我的项目。
              本人20岁男，新疆维吾尔族人。
            </p>
          </div>
        </section>

        <!-- 联系方式 -->
        <section class="max-w-4xl mx-auto mb-12 animate-slide-up">
          <div class="glass-card p-8 md:p-12">
            <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white text-center">
              联系方式
            </h2>
            
            <div class="grid md:grid-cols-2 gap-6">
              <div class="space-y-4">
                <div class="flex items-center space-x-4 p-4 rounded-lg bg-white/20 dark:bg-black/20 link-hover">
                  <div class="w-12 h-12 bg-blue-500 rounded-full flex items-center justify-center">
                    <span class="text-white font-bold">QQ</span>
                  </div>
                  <div>
                    <h3 class="font-semibold text-gray-800 dark:text-white">QQ</h3>
                    <p class="text-gray-600 dark:text-gray-400">3436464181</p>
                    <p class="text-sm text-gray-500 dark:text-gray-500">(QQ号不是群)</p>
                  </div>
                </div>

                <a 
                  href="https://github.com/ning-g-mo" 
                  target="_blank"
                  class="flex items-center space-x-4 p-4 rounded-lg bg-white/20 dark:bg-black/20 link-hover block"
                >
                  <div class="w-12 h-12 bg-gray-800 rounded-full flex items-center justify-center">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                      <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                    </svg>
                  </div>
                  <div>
                    <h3 class="font-semibold text-gray-800 dark:text-white">GitHub</h3>
                    <p class="text-gray-600 dark:text-gray-400">ning-g-mo</p>
                  </div>
                </a>
              </div>

              <div class="space-y-4">
                <a 
                  href="https://wiki.lemwood.cn" 
                  target="_blank"
                  class="flex items-center space-x-4 p-4 rounded-lg bg-white/20 dark:bg-black/20 link-hover block"
                >
                  <div class="w-12 h-12 bg-green-500 rounded-full flex items-center justify-center">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                      <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                    </svg>
                  </div>
                  <div>
                    <h3 class="font-semibold text-gray-800 dark:text-white">个人Wiki</h3>
                    <p class="text-gray-600 dark:text-gray-400">Wiki.lemwood.cn</p>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </section>

        <!-- 相关项目预览 -->
        <section class="max-w-4xl mx-auto animate-slide-up">
          <div class="glass-card p-8 md:p-12">
            <div class="flex justify-between items-center mb-8">
              <h2 class="text-3xl font-bold text-gray-800 dark:text-white">
                相关项目
              </h2>
              <button 
                @click="currentPage = 'projects'"
                class="text-blue-500 hover:text-blue-600 dark:text-blue-400 dark:hover:text-blue-300 transition-colors font-medium"
              >
                查看全部 →
              </button>
            </div>
            
            <div class="grid md:grid-cols-2 gap-6">
              <a 
                href="https://foldcraftlauncher.cn" 
                target="_blank"
                class="flex items-center space-x-4 p-6 rounded-lg bg-white/20 dark:bg-black/20 link-hover block"
              >
                <img 
                  src="/icons/fcl_logo.png" 
                  alt="FCL Logo" 
                  class="w-16 h-16 rounded-lg"
                >
                <div>
                  <h3 class="font-semibold text-gray-800 dark:text-white text-lg">FCL下载站</h3>
                  <p class="text-gray-600 dark:text-gray-400">foldcraftlauncher.cn</p>
                </div>
              </a>

              <a 
                href="https://zalithlauncher.cn" 
                target="_blank"
                class="flex items-center space-x-4 p-6 rounded-lg bg-white/20 dark:bg-black/20 link-hover block"
              >
                <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center">
                  <span class="text-white font-bold text-xl">Z</span>
                </div>
                <div>
                  <h3 class="font-semibold text-gray-800 dark:text-white text-lg">ZalithLauncher官网</h3>
                  <p class="text-gray-600 dark:text-gray-400">zalithlauncher.cn</p>
                </div>
              </a>
            </div>
          </div>
        </section>
      </div>

      <!-- 项目列表页面 -->
      <div v-else-if="currentPage === 'projects'" class="animate-fade-in">
        <!-- 项目页面头部 -->
        <header class="text-center mb-12 animate-fade-in">
          <h1 class="text-4xl md:text-6xl font-bold mb-4 gradient-text animate-slide-up">
            我的项目
          </h1>
          <p class="text-lg md:text-xl text-gray-700 dark:text-gray-300 mb-6 animate-slide-up">
            这里展示了我参与和维护的各种项目
          </p>
        </header>

        <!-- 项目分类 -->
        <div class="max-w-6xl mx-auto space-y-12">
          <!-- Minecraft 相关项目 -->
          <section class="animate-slide-up">
            <div class="glass-card p-8 md:p-12">
              <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white flex items-center">
                <div class="w-8 h-8 bg-green-500 rounded-lg mr-3 flex items-center justify-center">
                  <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M4 4h16v16H4V4zm2 2v12h12V6H6z"/>
                  </svg>
                </div>
                Minecraft 相关
              </h2>
              
              <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                <a 
                  href="https://foldcraftlauncher.cn" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <img 
                      src="/icons/fcl_logo.png" 
                      alt="FCL Logo" 
                      class="w-12 h-12 rounded-lg mr-3"
                    >
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">FCL下载站</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">启动器下载</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    FoldCraftLauncher 第三方下载站点，提供启动器以及相关插件文件的下载和更新服务，我提供了域名。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">网站</span>
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">下载</span>
                  </div>
                </a>

                <a 
                  href="https://zalithlauncher.cn" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-purple-500 rounded-lg mr-3 flex items-center justify-center">
                      <span class="text-white font-bold">Z</span>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">ZalithLauncher</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">启动器官网</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    ZalithLauncher 官方网站，一个功能强大的Android Minecraft 启动器项目。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200 text-xs rounded">官网</span>
                    <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">启动器</span>
                  </div>
                </a>

                <a 
                  href="https://www.minebbs.com/resources/geysermenu.8893/" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <img 
                      src="/icons/geysermenu_logo.png" 
                      alt="GeyserMenu Logo" 
                      class="w-12 h-12 rounded-lg mr-3"
                    >
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">GeyserMenu</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">基岩版表单插件</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    新一代geyser表单插件，轻量级的间歇泉表单插件，仅支持基岩版玩家使用。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 text-xs rounded">原创</span>
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">开源</span>
                    <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">基岩版</span>
                  </div>
                </a>

                <a 
                  href="https://www.minebbs.com/resources/bellcommand.8721/" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-yellow-500 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">BellCommand</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">物品命令插件</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    为你的物品设置左右键命令！允许服务器管理员创建可以执行命令的自定义物品。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 text-xs rounded">原创</span>
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">开源</span>
                    <span class="px-2 py-1 bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200 text-xs rounded">工具</span>
                  </div>
                </a>

                <a 
                  href="https://www.minebbs.com/resources/1-21-4-yc-leaves-tpa-home.8438/" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <img 
                      src="/icons/leaves_logo.png" 
                      alt="YC Server Logo" 
                      class="w-12 h-12 rounded-lg mr-3"
                    >
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">涌翠(YC)生电互通基础端</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">服务端整合包</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    基于leaves核心，生电专属，全力适配基岩版。包含TPA、Home、假人等功能。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">开源</span>
                    <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">生电</span>
                    <span class="px-2 py-1 bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200 text-xs rounded">整合包</span>
                  </div>
                </a>

                <a 
                  href="https://www.minebbs.com/resources/huskhomesform-huskhomes.9003/" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-cyan-500 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">HuskHomesForm</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">基岩版表单支持</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    为 HuskHomes 插件提供基岩版表单支持，让基岩版玩家也能使用GUI界面。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 text-xs rounded">原创</span>
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">开源</span>
                    <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">基岩版</span>
                  </div>
                </a>

                <a 
                  href="https://www.minebbs.com/resources/tpagui-tpa-gui.9002/" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-indigo-500 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">TpaGUI</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">TPA GUI插件</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    一个简单的为TPA提供GUI功能的插件，支持箱子菜单和基岩版表单，不需要任何依赖。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 text-xs rounded">原创</span>
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">开源</span>
                    <span class="px-2 py-1 bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200 text-xs rounded">GUI</span>
                  </div>
                </a>

                <a 
                  href="https://www.minebbs.com/resources/worldaliasvariables.8969/" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-emerald-500 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">WorldAliasVariables</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">世界别名插件</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    为你的服务器提供简单的世界别名，在不用任何多世界插件的情况下为世界设置别名。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 text-xs rounded">原创</span>
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">开源</span>
                    <span class="px-2 py-1 bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200 text-xs rounded">工具</span>
                  </div>
                </a>
              </div>
            </div>
          </section>

          <!-- 网站项目 -->
          <section class="animate-slide-up">
            <div class="glass-card p-8 md:p-12">
              <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white flex items-center">
                <div class="w-8 h-8 bg-blue-500 rounded-lg mr-3 flex items-center justify-center">
                  <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                  </svg>
                </div>
                网站项目
              </h2>
              
              <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                <a 
                  href="https://wiki.lemwood.cn" 
                  target="_blank"
                  class="glass-card p-6 link-hover block bg-white/10 dark:bg-black/10"
                >
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-green-500 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">个人Wiki</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">知识库</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    个人知识库和文档站点，记录学习笔记、项目文档和技术分享。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">Wiki</span>
                    <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">文档</span>
                  </div>
                </a>

                <div class="glass-card p-6 bg-white/10 dark:bg-black/10">
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-indigo-500 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">个人主页</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">当前站点</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    您正在浏览的这个个人主页，使用 Vue 3 + Tailwind CSS 构建。
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-indigo-100 dark:bg-indigo-900 text-indigo-800 dark:text-indigo-200 text-xs rounded">Vue 3</span>
                    <span class="px-2 py-1 bg-cyan-100 dark:bg-cyan-900 text-cyan-800 dark:text-cyan-200 text-xs rounded">Tailwind</span>
                  </div>
                </div>

                <div class="glass-card p-6 bg-white/10 dark:bg-black/10 opacity-75">
                  <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gray-400 rounded-lg mr-3 flex items-center justify-center">
                      <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                      </svg>
                    </div>
                    <div>
                      <h3 class="font-semibold text-gray-800 dark:text-white">更多项目</h3>
                      <p class="text-sm text-gray-600 dark:text-gray-400">正在考虑添加更多项目</p>
                    </div>
                  </div>
                  <p class="text-gray-700 dark:text-gray-300 text-sm mb-3">
                    更多有趣的项目正在开发中，敬请期待...
                  </p>
                  <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-gray-100 dark:bg-gray-900 text-gray-800 dark:text-gray-200 text-xs rounded">计划中</span>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- 项目统计 -->
          <section class="animate-slide-up">
            <div class="glass-card p-8 md:p-12">
              <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white text-center">
                项目统计
              </h2>
              
              <div class="grid md:grid-cols-4 gap-6 text-center">
                <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
                  <div class="text-3xl font-bold text-blue-500 mb-2">11+</div>
                  <div class="text-gray-700 dark:text-gray-300">总项目数</div>
                </div>
                <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
                  <div class="text-3xl font-bold text-purple-500 mb-2">9</div>
                  <div class="text-gray-700 dark:text-gray-300">MC 项目</div>
                </div>
                <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
                  <div class="text-3xl font-bold text-orange-500 mb-2">6</div>
                  <div class="text-gray-700 dark:text-gray-300">原创项目</div>
                </div>
                <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
                  <div class="text-3xl font-bold text-green-500 mb-2">8</div>
                  <div class="text-gray-700 dark:text-gray-300">开源项目</div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>

    <!-- 页脚 -->
    <footer class="text-center py-8 mt-16">
      <div class="glass-card max-w-md mx-auto p-6">
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
import { ref, onMounted } from 'vue'

// 页面状态管理
const currentPage = ref('home')

// 分离的主题状态：无图模式和暗色模式
const isMinimalMode = ref(true) // 默认为无图模式
const isDarkMode = ref(false)   // 默认为亮色

// 页面切换功能
const togglePage = () => {
  currentPage.value = currentPage.value === 'home' ? 'projects' : 'home'
}

// 获取页面切换提示文字
const getPageTooltip = () => {
  return currentPage.value === 'home' 
    ? '查看项目列表'
    : '返回主页'
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
    isMinimalMode.value = true
    isDarkMode.value = false
    saveThemeSettings()
  }
})


</script>