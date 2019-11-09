import Vue from "vue";
import VueAnalytics from 'vue-analytics';
import App from "./App.vue";
import './plugins/axios';
import vuetify from './plugins/vuetify';
import router from "./router";



Vue.config.productionTip = false;

Vue.use(VueAnalytics, {
  id: 'UA-91861663-2',
  router
})

new Vue({
  router,
  vuetify,
  render: h => h(App)
}).$mount("#app");



// ga('set', 'page', router.currentRoute.path);
// ga('send', 'pageview');

// router.afterEach(( to, from ) => {
//   ga('set', 'page', to.path);
//   ga('send', 'pageview');
// });