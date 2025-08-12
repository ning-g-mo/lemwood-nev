<template>
  <div class="min-h-screen" :class="getThemeClasses()">
    <!-- 主要内容 -->
    <div class="pb-8">
      <div class="max-w-4xl mx-auto px-4">
        <!-- 博客列表视图 -->
        <div v-if="currentView === 'list'" class="space-y-6">
          <div class="text-center mb-8">
            <h2 class="text-3xl font-bold text-gray-800 dark:text-white mb-2">博客文章</h2>
            <p class="text-gray-600 dark:text-gray-400">分享技术心得与生活感悟</p>
          </div>

          <!-- 文章列表 -->
          <div v-if="articles.length > 0" class="space-y-4">
            <article v-for="article in articles" :key="article.id" 
                     class="glass-card p-6 hover:shadow-lg transition-all duration-300 hover:scale-[1.02]">
              <div class="flex items-start justify-between mb-3">
                <h3 class="text-xl font-semibold text-gray-800 dark:text-white hover:text-blue-600 dark:hover:text-blue-400 transition-colors">
                  <router-link :to="`/blog/${article.id}`" class="hover:text-blue-600 dark:hover:text-blue-400 transition-colors">
                    {{ article.title }}
                  </router-link>
                </h3>
                <span class="text-sm text-gray-500 dark:text-gray-400 whitespace-nowrap ml-4">
                  {{ formatDate(article.date) }}
                </span>
              </div>
              
              <div class="flex items-center text-sm text-gray-600 dark:text-gray-400 mb-3">
                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                </svg>
                作者：{{ article.author }}
              </div>
              
              <p class="text-gray-700 dark:text-gray-300 line-clamp-3">
                {{ article.preview }}
              </p>
              
              <router-link :to="`/blog/${article.id}`" class="mt-4 flex items-center text-blue-600 dark:text-blue-400 text-sm hover:text-blue-800 dark:hover:text-blue-300 transition-colors">
                阅读更多
                <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                </svg>
              </router-link>
            </article>
          </div>

          <!-- 空状态 -->
          <div v-else class="text-center py-12">
            <svg class="w-16 h-16 mx-auto text-gray-400 dark:text-gray-600 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            <h3 class="text-lg font-medium text-gray-800 dark:text-white mb-2">暂无文章</h3>
            <p class="text-gray-600 dark:text-gray-400">还没有发布任何博客文章</p>
          </div>
        </div>

        <!-- 文章详情视图 -->
        <div v-else-if="currentView === 'article' && currentArticle" class="max-w-3xl mx-auto">
          <button @click="backToList" 
                  class="mb-6 inline-flex items-center text-blue-600 dark:text-blue-400 hover:text-blue-800 dark:hover:text-blue-300 transition-colors">
            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
            </svg>
            返回文章列表
          </button>

          <article class="glass-card p-8">
            <!-- 文章头部 -->
            <header class="mb-8 pb-6 border-b border-gray-200/50 dark:border-gray-700/50">
              <h1 class="text-3xl font-bold text-gray-800 dark:text-white mb-4">
                {{ currentArticle.title }}
              </h1>
              
              <div class="flex items-center text-sm text-gray-600 dark:text-gray-400 space-x-4">
                <div class="flex items-center">
                  <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                  </svg>
                  {{ currentArticle.author }}
                </div>
                <div class="flex items-center">
                  <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3a1 1 0 011-1h6a1 1 0 011 1v4m-6 0h6m-6 0a1 1 0 00-1 1v10a1 1 0 001 1h6a1 1 0 001-1V8a1 1 0 00-1-1"/>
                  </svg>
                  {{ formatDate(currentArticle.date) }}
                </div>
              </div>
            </header>

            <!-- 文章内容 -->
            <div class="prose prose-lg dark:prose-invert max-w-none" v-html="currentArticle.content">
            </div>
          </article>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'

// 路由相关
const route = useRoute()
const router = useRouter()

// 组件props
const props = defineProps({
  id: String
})

// 视图状态
const articles = ref([])
const currentArticle = ref(null)

// 根据路由参数计算当前视图
const currentView = computed(() => {
  return props.id ? 'article' : 'list'
})

// 获取主题CSS类（从父组件继承主题状态）
const getThemeClasses = () => {
  // 主题状态由App.vue统一管理，这里只返回基础样式
  return 'bg-transparent'
}

// 格式化日期
const formatDate = (dateString) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('zh-CN', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

// 查看文章
const viewArticle = (article) => {
  router.push(`/blog/${article.id}`)
}

// 返回文章列表
const backToList = () => {
  router.push('/blog')
}

// 根据ID查找文章
const findArticleById = (id) => {
  return articles.value.find(article => article.id.toString() === id)
}

// 解析Markdown文件头部信息
const parseMarkdownHeader = (rawContent) => {
  const lines = rawContent.split('\n')
  if (lines[0] !== '```') return null
  
  let headerEndIndex = -1
  for (let i = 1; i < lines.length; i++) {
    if (lines[i] === '```') {
      headerEndIndex = i
      break
    }
  }
  
  if (headerEndIndex === -1 || headerEndIndex < 4) return null
  
  const date = lines[1].trim()
  const title = lines[2].trim()
  const author = lines[3].trim()
  const content = lines.slice(headerEndIndex + 1).join('\n')
  
  return { date, title, author, content }
}

// 简单的Markdown转HTML
const markdownToHtml = (markdown) => {
  return markdown
    .replace(/^### (.*$)/gim, '<h3>$1</h3>')
    .replace(/^## (.*$)/gim, '<h2>$1</h2>')
    .replace(/^# (.*$)/gim, '<h1>$1</h1>')
    .replace(/\*\*(.*)\*\*/gim, '<strong>$1</strong>')
    .replace(/\*(.*)\*/gim, '<em>$1</em>')
    .replace(/\n\n/gim, '</p><p>')
    .replace(/\n/gim, '<br>')
    .replace(/^(.*)$/gim, '<p>$1</p>')
    .replace(/<p><\/p>/gim, '')
    .replace(/<p><h([1-6])>/gim, '<h$1>')
    .replace(/<\/h([1-6])><\/p>/gim, '</h$1>')
}

// 加载博客文章
const loadArticles = async () => {
  try {
    // 这里模拟加载Markdown文件
    // 在实际应用中，您需要实现文件读取逻辑
    const mockArticles = [
      {
        id: 1,
        filename: 'example1.md',
        rawContent: `\`\`\`
2025-01-20
我的第一篇博客
柠枺
\`\`\`

# 欢迎来到我的博客

这是我的第一篇博客文章。在这里我会分享一些技术心得和生活感悟。

## 关于这个博客系统

这个博客系统使用Vue.js构建，支持Markdown格式的文章。每篇文章都需要在开头包含元数据信息。

**主要特性：**
- 响应式设计
- 暗色主题支持
- Markdown渲染
- 简洁的界面

希望大家喜欢！`
      }
    ]

    const parsedArticles = []
    
    for (const mockArticle of mockArticles) {
      const parsed = parseMarkdownHeader(mockArticle.rawContent)
      if (parsed) {
        const htmlContent = markdownToHtml(parsed.content)
        const preview = parsed.content.substring(0, 150) + '...'
        
        parsedArticles.push({
          id: mockArticle.id,
          filename: mockArticle.filename,
          title: parsed.title,
          author: parsed.author,
          date: parsed.date,
          content: htmlContent,
          preview: preview
        })
      }
    }
    
    articles.value = parsedArticles.sort((a, b) => new Date(b.date) - new Date(a.date))
  } catch (error) {
    console.error('加载文章失败:', error)
  }
}

// 监听路由变化，更新当前文章
watch(() => props.id, (newId) => {
  if (newId && articles.value.length > 0) {
    currentArticle.value = findArticleById(newId)
    if (currentArticle.value) {
      // 更新页面标题
      document.title = `${currentArticle.value.title} - 柠枺的博客`
    }
  } else {
    currentArticle.value = null
    document.title = '柠枺 - 博客'
  }
}, { immediate: true })

// 监听文章列表变化，如果有ID参数则加载对应文章
watch(articles, (newArticles) => {
  if (props.id && newArticles.length > 0) {
    currentArticle.value = findArticleById(props.id)
    if (currentArticle.value) {
      document.title = `${currentArticle.value.title} - 柠枺的博客`
    }
  }
}, { immediate: true })

onMounted(() => {
  // 加载文章
  loadArticles()
})
</script>

<style scoped>
.glass-card {
  @apply backdrop-blur-md bg-white/80 dark:bg-gray-800/80 rounded-xl border border-white/20 dark:border-gray-700/50 shadow-lg;
}

.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.article-link {
  text-decoration: none;
  color: inherit;
}

.article-link:hover {
  color: #3b82f6;
}

.dark .article-link:hover {
  color: #60a5fa;
}

.read-more-btn {
  text-decoration: none;
  display: inline-flex;
  align-items: center;
}

/* Prose样式 */
.prose {
  @apply text-gray-700 dark:text-gray-300;
}

.prose h1 {
  @apply text-2xl font-bold text-gray-800 dark:text-white mb-4;
}

.prose h2 {
  @apply text-xl font-semibold text-gray-800 dark:text-white mb-3 mt-6;
}

.prose h3 {
  @apply text-lg font-medium text-gray-800 dark:text-white mb-2 mt-4;
}

.prose p {
  @apply mb-4 leading-relaxed;
}

.prose strong {
  @apply font-semibold text-gray-800 dark:text-white;
}

.prose em {
  @apply italic;
}
</style>