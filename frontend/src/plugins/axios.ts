import axios from 'axios'
import type {App} from 'vue'

export default {
    install: (app: App) => {
      app.config.globalProperties.$axios = axios.create()
    }
}
