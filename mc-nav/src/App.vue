<script setup>
import { ref, computed, watch, onMounted } from 'vue'
import { useDark, useToggle, useStorage } from '@vueuse/core'
import { NButton, NConfigProvider, darkTheme, NInput, NIcon, NEmpty } from 'naive-ui'
import NavSection from './components/NavSection.vue'
import { Search } from '@vicons/ionicons5'
import { h } from 'vue'

const isDark = useDark()
const toggleDark = useToggle(isDark)

// 判断是否为图片URL路径
const isImageUrl = (icon) => {
  if (!icon) return false
  return typeof icon === 'string' && (
    icon.startsWith('http') || 
    icon.startsWith('/') || 
    icon.startsWith('./') || 
    icon.startsWith('../') ||
    icon.match(/\.(png|jpg|jpeg|svg|webp|gif)$/)
  )
}

// 简化背景处理逻辑
const updateTheme = (dark) => {
  const body = document.body
  
  // 移除所有可能的类名
  body.classList.remove('dark-mode', 'light-mode')
  
  // 添加正确的类名
  body.classList.add(dark ? 'dark-mode' : 'light-mode')
}

// 初始化主题
onMounted(() => {
  updateTheme(isDark.value)
})

// 监听主题变化
watch(isDark, (newValue) => {
  updateTheme(newValue)
})

const searchQuery = ref('')
const showSearchResults = ref(false)

// 导航链接数据 - 只使用emoji图标
const links = ref([
  {
    category: '我的网站',
    icon: '🌐',
    items: [
      { name: '开发文档', url: 'https://wiki.lemwood.cn', icon: '📘' },
      { name: 'fold craft launcher', url: 'https://fcl.ningmo.fun', icon: '/icons/fcl_logo.png' }
    ]
  },
  {
    category: '我的资源',
    icon: '📦',
    items: [
      { name: '互通优化整合端', url: 'https://wiki.lemwood.cn/docs/leaves', icon: '/icons/leaves_logo.png' },
      { name: 'bellcommand', url: 'https://wiki.lemwood.cn/docs/bellcommand', icon: '⏲' },
      { name: 'geysermenu', url: 'https://wiki.lemwood.cn/docs/geysermenu', icon: '/icons/geysermenu_logo.png' }
    ]
  },
  {
    category: '其他',
    icon: '📘',
    items: [
      { name: '待定', url: 'https://wiki.lemwood.cn', icon: '📘' }
    ]
  }
])

// 搜索结果
const searchResults = computed(() => {
  if (!searchQuery.value.trim()) return []
  
  const query = searchQuery.value.toLowerCase().trim()
  const results = []
  
  links.value.forEach(section => {
    // 搜索分类名称
    const matchingCategory = section.category.toLowerCase().includes(query)
    
    // 搜索分类下的项目
    const matchingItems = section.items.filter(item => 
      item.name.toLowerCase().includes(query)
    )
    
    if (matchingCategory || matchingItems.length > 0) {
      results.push({
        category: section.category,
        icon: section.icon,
        items: matchingItems,
        isCategoryMatch: matchingCategory
      })
    }
  })
  
  return results
})

// 处理搜索框聚焦
function handleSearchFocus() {
  showSearchResults.value = true
}

// 处理点击外部区域
function handleOutsideClick(e) {
  if (!e.target.closest('.search-container') && !e.target.closest('.search-results')) {
    showSearchResults.value = false
  }
}

// 处理搜索框清空
function handleSearchClear() {
  searchQuery.value = ''
}
</script>

<template>
  <n-config-provider :theme="isDark ? darkTheme : null">
    <div class="glass-container" :class="{ 'dark-glass': isDark }" @click="handleOutsideClick">
      <header class="nav-header">
        <div class="logo-container">
          <img src="/logo.png" alt="Logo" class="logo-icon" />
          <h1>柠枺的MC导航站</h1>
        </div>
        <n-button @click="toggleDark()" class="theme-toggle">
          {{ isDark ? '🌙' : '☀️' }}
        </n-button>
      </header>
      
      <!-- 搜索框 -->
      <div class="search-container">
        <n-input
          v-model:value="searchQuery"
          placeholder="搜索导航链接..."
          clearable
          @focus="handleSearchFocus"
          @clear="handleSearchClear"
        >
          <template #prefix>
            <n-icon :component="h(Search)" />
          </template>
        </n-input>
        
        <!-- 搜索结果 -->
        <div class="search-results" v-if="showSearchResults && searchQuery.trim()">
          <div v-if="searchResults.length" class="results-content">
            <div v-for="(section, index) in searchResults" :key="index" class="result-section">
              <h3 :class="{ highlighted: section.isCategoryMatch }">
                <span v-if="!isImageUrl(section.icon)" class="icon">{{ section.icon }}</span>
                <img v-else :src="section.icon" alt="icon" class="icon-img" />
                {{ section.category }}
              </h3>
              <div class="result-items">
                <a v-for="item in section.items" 
                   :key="item.name" 
                   :href="item.url" 
                   class="result-item"
                   :class="{ 'dark-item': isDark }">
                  <span v-if="!isImageUrl(item.icon)" class="icon">{{ item.icon }}</span>
                  <img v-else :src="item.icon" alt="icon" class="icon-img" />
                  {{ item.name }}
                </a>
              </div>
            </div>
          </div>
          <n-empty v-else description="没有找到匹配的结果" />
        </div>
      </div>
      
      <!-- 导航部分 -->
      <NavSection 
        v-for="(section, index) in links"
        :key="index"
        :section="section"
      />

      <!-- ICP备案信息 -->
      <footer class="icp-footer">
        <a href="https://beian.miit.gov.cn/" target="_blank" rel="noopener noreferrer">
          新ICP备2024015133号-3
        </a>
      </footer>
    </div>
  </n-config-provider>
</template>

<style>
.glass-container {
  backdrop-filter: blur(12px) saturate(180%);
  background: rgba(255, 255, 255, 0.7);
  border-radius: clamp(12px, 3vw, 16px);
  padding: clamp(1.5rem, 4vw, 3rem);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.15);
  width: 100%;
  border: 1px solid rgba(255, 255, 255, 0.18);
  color: rgba(0, 0, 0, 0.9);
  box-sizing: border-box;
  overflow: hidden;
  transition: all 0.3s ease;
}

.dark-glass {
  background: rgba(20, 20, 25, 0.7);
  color: rgba(255, 255, 255, 0.9);
  border-color: rgba(255, 255, 255, 0.08);
  box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
}

.nav-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: clamp(1rem, 2vw, 1.5rem);
  gap: 1rem;
  flex-wrap: wrap;
}

.logo-container {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.logo-icon {
  width: clamp(2rem, 8vw, 2.5rem);
  height: clamp(2rem, 8vw, 2.5rem);
  object-fit: contain;
  filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.2));
}

.theme-toggle {
  min-width: 44px;
  height: 44px;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.2rem;
}

/* 搜索相关样式 */
.search-container {
  margin-bottom: clamp(1.5rem, 4vw, 2rem);
  position: relative;
  z-index: 10;
}

.search-results {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: rgba(255, 255, 255, 0.9);
  border-radius: 8px;
  margin-top: 0.5rem;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  max-height: 60vh;
  overflow-y: auto;
  border: 1px solid rgba(230, 230, 230, 0.7);
  z-index: 100;
}

.dark-glass .search-results {
  background: rgba(30, 30, 35, 0.9);
  border-color: rgba(60, 60, 65, 0.5);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.results-content {
  padding: 1rem;
}

.result-section {
  margin-bottom: 1rem;
}

.result-section:last-child {
  margin-bottom: 0;
}

.result-section h3 {
  font-size: 1rem;
  margin: 0 0 0.5rem 0;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.highlighted {
  background: rgba(255, 255, 150, 0.3);
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
}

.dark-glass .highlighted {
  background: rgba(255, 255, 150, 0.15);
}

.result-items {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 0.5rem;
}

.result-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem;
  border-radius: 4px;
  background: rgba(240, 240, 240, 0.5);
  color: inherit;
  text-decoration: none;
  transition: all 0.2s ease;
}

.result-item:hover {
  background: rgba(230, 230, 230, 0.8);
  transform: translateY(-2px);
}

.dark-glass .result-item {
  background: rgba(50, 50, 55, 0.5);
}

.dark-glass .result-item:hover {
  background: rgba(60, 60, 65, 0.8);
}

@media (max-width: 480px) {
  .glass-container {
    border-radius: 8px;
    padding: 1rem;
  }

  .nav-header {
    margin-bottom: 1rem;
    flex-direction: column;
    align-items: center;
  }

  h1 {
    font-size: 1.5rem;
  }
  
  .search-results {
    max-height: 70vh;
  }
  
  .result-items {
    grid-template-columns: 1fr;
  }
  
  .logo-container {
    margin-bottom: 0.5rem;
  }
  
  .theme-toggle {
    align-self: flex-end;
  }
}

/* ICP备案信息样式 */
.icp-footer {
  margin-top: 2rem;
  text-align: center;
  font-size: 0.9rem;
  opacity: 0.8;
}

.icp-footer a {
  color: inherit;
}

.icp-footer a:hover {
  opacity: 1;
}

.icon {
  font-size: 1.25rem;
  line-height: 1;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.icon-img {
  width: 1.25rem;
  height: 1.25rem;
  object-fit: contain;
  vertical-align: middle;
  border-radius: 4px;
}
</style>
