import { fileURLToPath, URL } from 'node:url'

import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'

// https://vitejs.dev/config/
export default defineConfig(({ command, mode }) => {

  const env = loadEnv(mode, process.cwd(), '')

  return {
    plugins: [
      vue(),
      vueJsx(),
    ],
    server: {
      proxy: {
        '/api': {
          target: env.VITE_BACKEND,
          changeOrigin: true,
          rewrite: (path) => path.replace(/^\/api/, '')
        }
      },
      watch: {
        usePolling: true,
      },
      host: true,
      strictPort: true,
      port: 8080,
    },
    resolve: {
      alias: {
        '@': fileURLToPath(new URL('./src', import.meta.url))
      }
    }
  }
})
