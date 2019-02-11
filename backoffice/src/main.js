import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
import i18n from './i18n'
import store from './store'

Vue.config.productionTip = false

new Vue({
    data: {
		activeDivs: [ 'clients', 'projects' ]
	},

    router,
    i18n,
    store,
    render: function (h) { return h(App) }
}).$mount('#app')
