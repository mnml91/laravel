<?php

Auth::routes(['verify' => true]);

Route::get('/', 'HomeController@index')->name('home');
Route::get('/dka', 'DkaController@index')->name('dka')->middleware(['auth', 'password.confirm']);
Route::get('/chart-line-data', 'DkaController@chartLineData')->name('chart-line-data');
Route::get('/chart-pie-data', 'DkaController@chartPieData')->name('chart-pie-data');

Route::get('/speech-test', function () {
    return view('speech-test.test');
})->name('speech-test');
