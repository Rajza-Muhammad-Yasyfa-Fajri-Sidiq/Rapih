<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\BarangMasuk;
use App\Models\BarangKeluar;
use App\Models\KategoriBarang;
use App\Models\Supplier;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $totalBarang = Barang::count();
        $totalKategori = KategoriBarang::count();
        $totalSupplier = Supplier::count();
        $stokMenipis = Barang::whereColumn('stok', '<', 'stok_minimum')->count();

        // 5 barang stok terendah
        $barangTerendah = Barang::with(['kategori', 'satuan'])
            ->orderBy('stok', 'asc')
            ->take(5)
            ->get();

        // Data chart: barang masuk vs keluar per bulan (6 bulan terakhir)
        $months = collect();
        for ($i = 5; $i >= 0; $i--) {
            $months->push(now()->subMonths($i)->format('Y-m'));
        }

        $chartLabels = $months->map(fn($m) => \Carbon\Carbon::parse($m . '-01')->translatedFormat('M Y'))->toArray();

        $dataMasuk = $months->map(function ($m) {
            return BarangMasuk::whereYear('tanggal', substr($m, 0, 4))
                ->whereMonth('tanggal', substr($m, 5, 2))
                ->sum('jumlah');
        })->toArray();

        $dataKeluar = $months->map(function ($m) {
            return BarangKeluar::whereYear('tanggal', substr($m, 0, 4))
                ->whereMonth('tanggal', substr($m, 5, 2))
                ->sum('jumlah');
        })->toArray();

        return view('dashboard', compact(
            'totalBarang', 'totalKategori', 'totalSupplier', 'stokMenipis',
            'barangTerendah', 'chartLabels', 'dataMasuk', 'dataKeluar'
        ));
    }
}
