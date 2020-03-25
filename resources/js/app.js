
require('./bootstrap');

window.Vue = require('vue');

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('dka-component', require('./components/DkaComponent.vue').default);

const app = new Vue({
    el: '#app',
});
