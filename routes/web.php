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

/*Route::get('/', function () {
    return view('welcome');
});*/

Route::get('/admin-lte', function () {
    return view('admin_template');
});
Route::get('/admin-lte-login', function () {
    return view('admin_login');
});
Route::get('/lte_fixed', 'BenchmarkController@lte_fixed')->name('lte_fixed');
Route::get('/home', 'HomeController@index')->name('home');

Route::get('cron_job/idle_contact', 'CronJobController@idle_contact')->name('cron_job/idle_contact');

Auth::routes();

//Dashboard Module
Route::get('dashboard', ['as'=>'dashboard','uses'=>'DashboardController@index'])->middleware('auth');
Route::get('/', ['as'=>'/','uses'=>'DashboardController@index'])->middleware('auth');

//User Module
Route::get('/users', ['as'=>'users','uses'=>'UserController@index'])->middleware('auth');
Route::get('user/profile', ['as'=>'user/profile','uses'=>'UserController@profile'])->middleware('auth');
Route::post('user/update_profile', ['as'=>'user/update_profile','uses'=>'UserController@updateProfile'])->middleware('auth');
Route::get('user/create', ['as'=>'user/create','uses'=>'UserController@create'])->middleware('auth');
Route::post('user/store', ['as'=>'user/store','uses'=>'UserController@store'])->middleware('auth');
Route::get('user/edit/{user_id}', ['as'=>'user/edit','uses'=>'UserController@edit'])->middleware('auth');
Route::post('user/update', ['as'=>'user/update','uses'=>'UserController@update'])->middleware('auth');
Route::post('user/destroy', ['as'=>'user/destroy','uses'=>'UserController@destroy'])->middleware('auth');
Route::post('user/activate', ['as'=>'user/activate','uses'=>'UserController@activate'])->middleware('auth');
Route::post('user/deactivate', ['as'=>'user/deactivate','uses'=>'UserController@deactivate'])->middleware('auth');
Route::post('user/send_login_link', ['as'=>'user/send_login_link','uses'=>'UserController@send_login_link'])->middleware('auth');
Route::post('client_login', ['as'=>'user/client_login','uses'=>'UserController@client_login'])->middleware('auth');
Route::post('user/send_reset_password', ['as'=>'user/send_reset_password','uses'=>'UserController@send_reset_password'])->middleware('auth');
Route::get('/reset_password', ['as'=>'change_password/reset_password','uses'=>'ChangePasswordController@reset_password']);
Route::post('/change_password', ['as'=>'change_password/update_password','uses'=>'ChangePasswordController@update_password']);

//Group Module
Route::get('/groups', ['as'=>'groups','uses'=>'GroupController@index'])->middleware('auth');
Route::get('group/create', ['as'=>'group/create','uses'=>'GroupController@create'])->middleware('auth');
Route::post('group/store', ['as'=>'group/store','uses'=>'GroupController@store'])->middleware('auth');
Route::get('group/edit/{group_id}', ['as'=>'group/edit','uses'=>'GroupController@edit'])->middleware('auth');
Route::post('group/update', ['as'=>'group/update','uses'=>'GroupController@update'])->middleware('auth');
Route::post('group/destroy', ['as'=>'group/destroy','uses'=>'GroupController@destroy'])->middleware('auth');

//Benchmark
Route::get('benchmark/test_model', ['as'=>'benchmark/test_model','uses'=>'BenchmarkController@testModel'])->middleware('auth');
Route::get('benchmark/test_email', ['as'=>'benchmark/test_email','uses'=>'BenchmarkController@testMail'])->middleware('auth');

//Autocomplete
Route::get('/_get_contact_list', ['as'=>'auto_complete/ajax_search_contacts','uses'=>'AutoCompleteController@ajax_search_contacts']);

//Items
Route::get('/item', ['as'=>'item','uses'=>'ItemController@index'])->middleware('auth');
Route::get('/item/create', ['as'=>'item/create','uses'=>'ItemController@create'])->middleware('auth');
Route::post('item/store', ['as'=>'item/store','uses'=>'ItemController@store'])->middleware('auth');
Route::get('item/edit/{item_category_id}', ['as'=>'item/edit','uses'=>'ItemController@edit'])->middleware('auth');
Route::post('item/update', ['as'=>'item/update','uses'=>'ItemController@update'])->middleware('auth');
Route::post('item/destroy', ['as'=>'item/destroy','uses'=>'ItemController@destroy'])->middleware('auth');

//Item Categories
Route::get('/item_category', ['as'=>'item_category','uses'=>'ItemCategoryController@index'])->middleware('auth');
Route::get('/item_category/create', ['as'=>'item_category/create','uses'=>'ItemCategoryController@create'])->middleware('auth');
Route::post('item_category/store', ['as'=>'item_category/store','uses'=>'ItemCategoryController@store'])->middleware('auth');
Route::get('item_category/edit/{item_category_id}', ['as'=>'item_category/edit','uses'=>'ItemCategoryController@edit'])->middleware('auth');
Route::post('item_category/update', ['as'=>'item_category/update','uses'=>'ItemCategoryController@update'])->middleware('auth');
Route::post('item_category/destroy', ['as'=>'item_category/destroy','uses'=>'ItemCategoryController@destroy'])->middleware('auth');

//Inventory
Route::get('/inventory', ['as'=>'inventory','uses'=>'InventoryController@index'])->middleware('auth');
Route::get('/inventory/create', ['as'=>'inventory/create','uses'=>'InventoryController@create'])->middleware('auth');
Route::post('inventory/store', ['as'=>'inventory/store','uses'=>'InventoryController@store'])->middleware('auth');
Route::get('inventory/edit/{item_id}', ['as'=>'inventory/edit','uses'=>'InventoryController@edit'])->middleware('auth');
Route::post('inventory/update', ['as'=>'inventory/update','uses'=>'InventoryController@update'])->middleware('auth');
Route::post('inventory/destroy', ['as'=>'inventory/destroy','uses'=>'InventoryController@destroy'])->middleware('auth');
