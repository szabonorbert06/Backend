<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\UserController;

Route::get('/', function () {
    return view('welcome');
});

/*
//basic route
Route::get('/greeting', function () {
    return 'Hello World';
});
*/

//creating basic view => /routes/greeting.blade.php
Route::get('/greeting', function () {
    return view('greeting', ['name_Geza' => 'Géza']);
});

//route with parameters
Route::get('/user/{id}', function (string $id) {
    return 'User '.$id;
});

//named route
Route::get('/greeting123', function () {
    return 'Hello World';
}) ->name('greeting');

//redirect route
Route::redirect('/', '/greeting123');

/*
//view route
Route::get('/about', function () {
   return view('about');
});
*/

//view route
Route::get('/about', function () {
    return view('about', ['name_Geza' => 'Géza']);
});

//contact routes
Route::get('/contact', function () {
    return view('contact');
});

//route from controller
Route::get('/user', [UserController::class, 'index']);

//Named route
Route::get('/greeting123', function () {
    return 'hello :';
}) ->name('greeting123');
