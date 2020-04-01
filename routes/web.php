<?php

Auth::routes(['verify' => true]);

Route::get('/', 'HomeController@index')->name('home');
Route::get('/dka', 'DkaController@index')->name('dka');
Route::get('/chart-line-data', 'DkaController@chartLineData')->name('chart-line-data');
Route::get('/chart-pie-data', 'DkaController@chartPieData')->name('chart-pie-data');
