const mix = require('laravel-mix');

mix.setPublicPath('public/build')
    .setResourceRoot('build')
    .js('resources/js/app.js', 'js')
    .js('resources/js/speech-test.js', 'js')
    .sass('resources/sass/app.scss', 'css')
    .version();
