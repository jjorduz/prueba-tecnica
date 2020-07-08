<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::post('/autocompletar_usuario_email','UserController'.'@autocompletar_usuario_email');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get("personas","PersonasController@index");
Route::post("personas","PersonasController@store");
Route::put("personas/{id}","PersonasController@update");
Route::delete("personas/{id}","PersonasController@destroy");
Route::get("personas/nucleo/{id}","PersonasController@get_nucleo");