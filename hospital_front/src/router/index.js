import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/doctors',
    name: 'doctors',
    meta: {
      requiresAuth: true
    },
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DoctorsView.vue')
  },
  {
    path: '/appointments',
    name: 'appointments',
    meta: {
      requiresAuth: true
    },
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AppointmentsView.vue')
  },
  {
    path: '/doctors/:id',
    name: 'doctorDetail',
    meta: {
      requiresAuth: true
    },
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DoctorsDetailedView.vue')
  },
  {
    path: '/auth',
    name: 'auth',
    meta: {
      requiresAuth: false
    },
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AuthView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  // eslint-disable-next-line no-unused-vars
  scrollBehavior(to, from, savedPosition) {
    if (to.hash) {
      // eslint-disable-next-line no-unused-vars
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          resolve({ el: to.hash, behavior: 'smooth' })
        }, 500)
    })
  }
  },
})

router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth && !localStorage.auth_token) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    next({
      path: '/auth',
      // save the location we were at to come back later
      query: { redirect: to.fullPath },
    })
  }
  else {
    next()
  }
});

export default router
