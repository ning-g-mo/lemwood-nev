import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Projects from '../views/Projects.vue'
import Blog from '../views/Blog.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: { title: '柠枺 - 首页' }
  },
  {
    path: '/projects',
    name: 'Projects',
    component: Projects,
    meta: { title: '柠枺 - 项目统计' }
  },
  {
    path: '/blog',
    name: 'Blog',
    component: () => import('../views/Blog.vue'),
    meta: { title: '柠枺 - 博客' }
  },
  {
    path: '/blog/:id',
    name: 'BlogArticle',
    component: () => import('../views/Blog.vue'),
    props: true,
    meta: { title: '柠枺 - 博客文章' }
  },
  // 重定向处理
  {
    path: '/:pathMatch(.*)*',
    redirect: '/'
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  }
})

// 路由守卫 - 更新页面标题
router.beforeEach((to, from, next) => {
  document.title = to.meta.title || '柠枺'
  next()
})

export default router