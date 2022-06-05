import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
// import store from './store'
import VueAxios from 'vue-axios'
// import {createMetaManager} from 'vue-meta'
import { plainAxiosInstance } from './axios'
import './index.css'

// let localAuthToken = localStorage.auth_token;
// let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
// if (cookieExists) {
//   const auth_token = localStorage.getItem("auth_token");
//   const authTokenExists = auth_token !== "undefined" && auth_token !== null;
//   if (authTokenExists) {
//     store.dispatch("loginUserWithToken", { auth_token });
//   }
// }

const app = createApp(App)
  .use(router)
  .use(VueAxios, {axiosPlain: plainAxiosInstance})

app.use({
  install(app) {
    app.config.globalProperties.$localStorage = createApp({
      data() { 
        return {
        auth_token: localStorage.auth_token
        }
      },
      watch: { 
        auth_token(value){
          localStorage.auth_token = value
        }
      }
    }).mount(document.createElement('div'))
  }
})

app.mount('#app');