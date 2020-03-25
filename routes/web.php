<?php

Auth::routes();

Route::get('/', 'HomeController@index')->name('home');
Route::get('/cabinet', 'Cabinet\HomeController@index')->name('cabinet');
Route::get('/dka', 'DkaController@index')->name('dka');
Route::get('/chart-data', 'DkaController@chartData')->name('chart-data');
