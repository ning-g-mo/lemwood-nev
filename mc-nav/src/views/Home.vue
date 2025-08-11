<template>
  <div class="animate-fade-in">
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
        "世界源于灵魂的幻想"
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
          <router-link 
            to="/projects"
            class="text-blue-500 hover:text-blue-600 dark:text-blue-400 dark:hover:text-blue-300 transition-colors font-medium"
          >
            查看全部 →
          </router-link>
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
            <img 
              src="/icons/zl_icon.png" 
              alt="ZalithLauncher Logo" 
              class="w-16 h-16 rounded-lg"
            >
            <div>
              <h3 class="font-semibold text-gray-800 dark:text-white text-lg">ZalithLauncher官网</h3>
              <p class="text-gray-600 dark:text-gray-400">zalithlauncher.cn</p>
            </div>
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
// Home页面组件，无需额外逻辑
</script>