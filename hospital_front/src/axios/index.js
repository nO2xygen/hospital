import axios from 'axios'
// import router from '@/router'

const API_URL = 'http://localhost:3000/'

const plainAxiosInstance = axios.create({
  baseURL: API_URL,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json'
  }
})

plainAxiosInstance.interceptors.request.use(
  config => {
    let token = localStorage.auth_token;
    if (token) {
      config.headers.Authorization = token;
    }
    return config;
  }
);

plainAxiosInstance.interceptors.response.use(
  response => {
    // Not logged in or session expired
    // if (response.data.user === null) {
    //   //Redirect to login page
    //   router.replace({path: '/auth',query: {redirect: router.currentRoute.fullPath}})
    // }
    return response;
  },
);

export { plainAxiosInstance }