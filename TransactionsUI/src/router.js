import Vue from 'vue'
import Router from 'vue-router'
import Main from './components/Main.vue';

Vue.use(Router)

const router = new Router({
  mode:"history",
  routes: [
    {
      path: '/main',
      name: 'mainpage',
      component: Main
    },    
    {
      path: '/*',
      redirect: '/main'
      // component: Main
    }
  ]
})

export default router;