<template>
  <div class="nav-section">
    <h2 class="section-title" :class="{ 'dark-title': isDark }">
      <span v-if="!isImageUrl(section.icon)" class="section-icon">{{ section.icon }}</span>
      <img v-else :src="section.icon" alt="icon" class="section-icon-img" />
      {{ section.category }}
    </h2>
    <div class="section-items">
      <a 
        v-for="item in section.items" 
        :key="item.name"
        :href="item.url"
        target="_blank"
        rel="noopener noreferrer"
        class="nav-item"
        :class="{ 'dark-item': isDark }"
      >
        <span v-if="!isImageUrl(item.icon)" class="item-icon">{{ item.icon }}</span>
        <img v-else :src="item.icon" alt="icon" class="item-icon-img" />
        {{ item.name }}
      </a>
    </div>
  </div>
</template>

<script setup>
import { inject } from 'vue'
import { useDark } from '@vueuse/core'

const props = defineProps({
  section: {
    type: Object,
    required: true
  }
})

const isDark = useDark()

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
</script>

<style scoped>
.nav-section {
  margin-bottom: clamp(1.5rem, 4vw, 2.5rem);
  width: 100%;
}

.section-title {
  font-size: clamp(1.25rem, 3vw, 1.5rem);
  margin-bottom: clamp(0.75rem, 2vw, 1rem);
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, 0.9);
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.5);
}

.dark-title {
  color: rgba(255, 255, 255, 0.95);
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
}

.section-items {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
  gap: clamp(0.75rem, 2vw, 1rem);
  width: 100%;
}

.nav-item {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: clamp(0.75rem, 2vw, 1rem);
  background: rgba(255, 255, 255, 0.3);
  border-radius: 8px;
  transition: all 0.3s ease;
  min-height: 44px;
  color: rgba(0, 0, 0, 0.85);
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.3);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.nav-item:hover {
  transform: translateY(-2px);
  background: rgba(255, 255, 255, 0.4);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  color: rgba(0, 0, 0, 1);
}

.dark-item {
  background: rgba(0, 0, 0, 0.3);
  color: rgba(255, 255, 255, 0.9);
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
  border-color: rgba(255, 255, 255, 0.1);
}

.dark-item:hover {
  background: rgba(30, 30, 35, 0.5);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
  color: rgba(255, 255, 255, 1);
  border-color: rgba(255, 255, 255, 0.2);
}

.section-icon {
  font-size: 1.5rem;
  line-height: 1;
}

.section-icon-img {
  width: 1.5rem;
  height: 1.5rem;
  object-fit: contain;
}

.item-icon {
  font-size: 1.25rem;
  line-height: 1;
}

.item-icon-img {
  width: 1.25rem;
  height: 1.25rem;
  object-fit: contain;
}

/* 响应式调整 */
@media (min-width: 1024px) {
  .section-items {
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  }
}

@media (max-width: 768px) {
  .section-items {
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  }
}

@media (max-width: 480px) {
  .nav-section {
    margin-bottom: 1.5rem;
  }

  .section-title {
    font-size: 1.25rem;
    margin-bottom: 0.75rem;
  }

  .section-items {
    grid-template-columns: 1fr;
    gap: 0.75rem;
  }

  .nav-item {
    padding: 0.75rem;
  }
}
</style>