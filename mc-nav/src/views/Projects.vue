<template>
  <div class="animate-fade-in">
    <!-- 页面标题 -->
    <header class="text-center mb-12 animate-fade-in">
      <h1 class="text-4xl md:text-6xl font-bold mb-4 gradient-text animate-slide-up">
        项目列表
      </h1>
      <p class="text-lg md:text-xl text-gray-700 dark:text-gray-300 animate-slide-up">
        我的开源项目和作品展示
      </p>
    </header>

    <!-- Minecraft相关项目 -->
    <section class="max-w-6xl mx-auto mb-12 animate-slide-up">
      <div class="glass-card p-8 md:p-12">
        <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white">
          Minecraft相关项目
        </h2>
        
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          <!-- 项目卡片 -->
          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-blue-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">MC</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">MC-Nav</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">Vue3</span>
                  <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">导航</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              个人主页和项目导航网站，采用现代化设计风格，支持深色模式和响应式布局。
            </p>
            <div class="flex space-x-2">
              <a href="https://github.com/ning-g-mo/mc-nav" target="_blank" class="btn-secondary text-sm">
                GitHub
              </a>
              <a href="https://lemwood.cn" target="_blank" class="btn-primary text-sm">
                预览
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 rounded-lg flex items-center justify-center mr-4 overflow-hidden">
                <img src="/icons/leaves_logo.png" alt="涌翠(YC)生电互通基础端" class="w-full h-full object-cover">
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">涌翠(YC)生电互通基础端</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-red-100 dark:bg-red-900 text-red-800 dark:text-red-200 text-xs rounded">leaves</span>
                  <span class="px-2 py-1 bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200 text-xs rounded">生电</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              为涌翠服务器定制的生电互通基础端，包含多种实用功能和优化。
            </p>
            <div class="flex space-x-2">
              <a href="https://www.minebbs.com/resources/yc-leaves-tpa-home.9012/" target="_blank" class="btn-primary text-sm">
                MineBBS
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 rounded-lg flex items-center justify-center mr-4 overflow-hidden">
                <img src="/icons/geysermenu_logo.png" alt="GeyserMenu" class="w-full h-full object-cover">
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">GeyserMenu</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-yellow-100 dark:bg-yellow-900 text-yellow-800 dark:text-yellow-200 text-xs rounded">Spigot</span>
                  <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">GUI</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              为Geyser插件提供的GUI菜单界面，方便基岩版玩家使用服务器功能。
            </p>
            <div class="flex space-x-2">
              <a href="https://www.minebbs.com/resources/geysermenu-geyser.10502/" target="_blank" class="btn-primary text-sm">
                MineBBS
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-orange-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">H</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">HuskHomesForm</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-yellow-100 dark:bg-yellow-900 text-yellow-800 dark:text-yellow-200 text-xs rounded">Spigot</span>
                  <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">GUI</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              为HuskHomes插件提供的GUI界面，让玩家更方便地管理家园和传送点。
            </p>
            <div class="flex space-x-2">
              <a href="https://www.minebbs.com/resources/huskhomesform-huskhomes.10836/" target="_blank" class="btn-primary text-sm">
                MineBBS
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-purple-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">T</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">TpaGUI</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-yellow-100 dark:bg-yellow-900 text-yellow-800 dark:text-yellow-200 text-xs rounded">Spigot</span>
                  <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">传送</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              简化玩家传送请求的GUI插件，提供直观的界面来管理传送请求。
            </p>
            <div class="flex space-x-2">
              <a href="https://www.minebbs.com/resources/tpagui-tpa-gui.10835/" target="_blank" class="btn-primary text-sm">
                MineBBS
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-indigo-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">W</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">WorldAliasVariables</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-yellow-100 dark:bg-yellow-900 text-yellow-800 dark:text-yellow-200 text-xs rounded">Spigot</span>
                  <span class="px-2 py-1 bg-gray-100 dark:bg-gray-900 text-gray-800 dark:text-gray-200 text-xs rounded">工具</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              为Minecraft服务器提供世界别名变量功能，简化多世界管理。
            </p>
            <div class="flex space-x-2">
              <a href="https://www.minebbs.com/resources/worldaliasvariables.10485/" target="_blank" class="btn-primary text-sm">
                MineBBS
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-yellow-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">B</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">BellCommand</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-yellow-100 dark:bg-yellow-900 text-yellow-800 dark:text-yellow-200 text-xs rounded">Spigot</span>
                  <span class="px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 text-xs rounded">音效</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              为Minecraft服务器添加钟声命令功能，支持自定义音效和范围。
            </p>
            <div class="flex space-x-2">
              <a href="https://www.minebbs.com/resources/bellcommand.10134/" target="_blank" class="btn-primary text-sm">
                MineBBS
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 网站项目 -->
    <section class="max-w-6xl mx-auto mb-12 animate-slide-up">
      <div class="glass-card p-8 md:p-12">
        <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white">
          网站项目
        </h2>
        
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-green-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">W</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">个人Wiki</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">MediaWiki</span>
                  <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">知识库</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              个人知识库和文档站点，记录学习笔记和项目文档。
            </p>
            <div class="flex space-x-2">
              <a href="https://wiki.lemwood.cn" target="_blank" class="btn-primary text-sm">
                访问
              </a>
            </div>
          </div>

          <div class="project-card">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-blue-500 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">主</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">个人主页</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 text-xs rounded">Vue3</span>
                  <span class="px-2 py-1 bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-xs rounded">响应式</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              当前网站，展示个人信息和项目作品的主页。
            </p>
            <div class="flex space-x-2">
              <router-link to="/" class="btn-primary text-sm">
                首页
              </router-link>
            </div>
          </div>

          <div class="project-card opacity-60">
            <div class="flex items-center mb-4">
              <div class="w-12 h-12 bg-gray-400 rounded-lg flex items-center justify-center mr-4">
                <span class="text-white font-bold">+</span>
              </div>
              <div>
                <h3 class="font-semibold text-gray-800 dark:text-white">更多项目</h3>
                <div class="flex flex-wrap gap-1 mt-1">
                  <span class="px-2 py-1 bg-gray-100 dark:bg-gray-900 text-gray-800 dark:text-gray-200 text-xs rounded">敬请期待</span>
                </div>
              </div>
            </div>
            <p class="text-gray-600 dark:text-gray-400 text-sm mb-4">
              更多有趣的项目正在开发中...
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- 项目统计 -->
    <section class="max-w-4xl mx-auto animate-slide-up">
      <div class="glass-card p-8 md:p-12">
        <h2 class="text-3xl font-bold mb-8 text-gray-800 dark:text-white text-center">
          项目统计
        </h2>
        
        <div class="grid md:grid-cols-3 gap-6 text-center">
          <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
            <div class="text-3xl font-bold text-blue-500 mb-2">6+</div>
            <div class="text-gray-600 dark:text-gray-400">开源项目</div>
          </div>
          
          <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
            <div class="text-3xl font-bold text-green-500 mb-2">2+</div>
            <div class="text-gray-600 dark:text-gray-400">网站项目</div>
          </div>
          
          <div class="p-6 rounded-lg bg-white/20 dark:bg-black/20">
            <div class="text-3xl font-bold text-purple-500 mb-2">∞</div>
            <div class="text-gray-600 dark:text-gray-400">持续更新</div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
// Projects页面组件，无需额外逻辑
</script>

<style scoped>
.project-card {
  @apply p-6 rounded-lg bg-white/20 dark:bg-black/20 hover:bg-white/30 dark:hover:bg-black/30 transition-all duration-300 hover:scale-105 hover:shadow-lg;
}
</style>