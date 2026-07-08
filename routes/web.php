<?php

use App\Http\Controllers\ActivityLogController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\BarangMasukController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KategoriBarangController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SatuanController;
use App\Http\Controllers\SupplierController;
use Illuminate\Support\Facades\Route;

Route::get('/', fn() => redirect()->route('login'));

Route::get('/dashboard', [DashboardController::class, 'index'])
    ->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Admin only — Master Data
Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::resource('kategori-barang', KategoriBarangController::class)->except('show');
    Route::resource('satuan', SatuanController::class)->except('show');
    Route::resource('supplier', SupplierController::class)->except('show');
    Route::resource('barang', BarangController::class);

    // Laporan
    Route::get('/laporan', [LaporanController::class, 'index'])->name('laporan.index');
    Route::get('/laporan/export-excel', [LaporanController::class, 'exportExcel'])->name('laporan.export-excel');
    Route::get('/laporan/export-pdf', [LaporanController::class, 'exportPdf'])->name('laporan.export-pdf');

    // Activity Log
    Route::get('/activity-log', [ActivityLogController::class, 'index'])->name('activity-log.index');
});

// Admin + Petugas — Transaksi
Route::middleware(['auth', 'role:admin,petugas'])->group(function () {
    Route::resource('barang-masuk', BarangMasukController::class)->only(['index', 'create', 'store', 'show']);
    Route::resource('barang-keluar', BarangKeluarController::class)->only(['index', 'create', 'store', 'show']);
});

require __DIR__.'/auth.php';
