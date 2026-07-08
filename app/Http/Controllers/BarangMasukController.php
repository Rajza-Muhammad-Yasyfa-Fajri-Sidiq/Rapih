<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\BarangMasuk;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BarangMasukController extends Controller
{
    public function index(Request $request)
    {
        $query = BarangMasuk::with(['barang', 'supplier', 'user']);
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('kode_transaksi', 'like', '%' . $request->search . '%')
                  ->orWhereHas('barang', fn($q2) => $q2->where('nama_barang', 'like', '%' . $request->search . '%'));
            });
        }
        $barangMasuks = $query->latest()->paginate(10)->withQueryString();
        return view('barang-masuk.index', compact('barangMasuks'));
    }

    public function create()
    {
        $barangs = Barang::all();
        $suppliers = Supplier::all();
        return view('barang-masuk.create', compact('barangs', 'suppliers'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'barang_id' => 'required|exists:barang,id',
            'supplier_id' => 'required|exists:supplier,id',
            'jumlah' => 'required|integer|min:1',
            'harga_beli' => 'required|numeric|min:0',
            'tanggal' => 'required|date',
            'keterangan' => 'nullable|string',
        ]);

        DB::transaction(function () use ($request) {
            $lastCode = BarangMasuk::where('kode_transaksi', 'like', 'BM-' . now()->format('Ymd') . '-%')
                ->orderByDesc('kode_transaksi')->first();
            $nextNum = $lastCode ? (int) substr($lastCode->kode_transaksi, -4) + 1 : 1;
            $kodeTransaksi = 'BM-' . now()->format('Ymd') . '-' . str_pad($nextNum, 4, '0', STR_PAD_LEFT);

            BarangMasuk::create([
                'kode_transaksi' => $kodeTransaksi,
                'barang_id' => $request->barang_id,
                'supplier_id' => $request->supplier_id,
                'user_id' => auth()->id(),
                'jumlah' => $request->jumlah,
                'harga_beli' => $request->harga_beli,
                'tanggal' => $request->tanggal,
                'keterangan' => $request->keterangan,
            ]);
        });

        return redirect()->route('barang-masuk.index')->with('success', 'Barang masuk berhasil dicatat.');
    }

    public function show(BarangMasuk $barangMasuk)
    {
        $barangMasuk->load(['barang', 'supplier', 'user']);
        return view('barang-masuk.show', compact('barangMasuk'));
    }
}
