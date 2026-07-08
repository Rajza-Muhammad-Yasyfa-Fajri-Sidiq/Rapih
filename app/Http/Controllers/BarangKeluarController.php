<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\BarangKeluar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BarangKeluarController extends Controller
{
    public function index(Request $request)
    {
        $query = BarangKeluar::with(['barang', 'user']);
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('kode_transaksi', 'like', '%' . $request->search . '%')
                  ->orWhereHas('barang', fn($q2) => $q2->where('nama_barang', 'like', '%' . $request->search . '%'));
            });
        }
        $barangKeluars = $query->latest()->paginate(10)->withQueryString();
        return view('barang-keluar.index', compact('barangKeluars'));
    }

    public function create()
    {
        $barangs = Barang::where('stok', '>', 0)->get();
        return view('barang-keluar.create', compact('barangs'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'barang_id' => 'required|exists:barang,id',
            'jumlah' => 'required|integer|min:1',
            'tanggal' => 'required|date',
            'keterangan' => 'nullable|string',
        ]);

        $barang = Barang::findOrFail($request->barang_id);
        if ($barang->stok < $request->jumlah) {
            return back()->withErrors(['jumlah' => 'Stok tidak mencukupi. Stok tersedia: ' . $barang->stok])->withInput();
        }

        DB::transaction(function () use ($request) {
            $lastCode = BarangKeluar::where('kode_transaksi', 'like', 'BK-' . now()->format('Ymd') . '-%')
                ->orderByDesc('kode_transaksi')->first();
            $nextNum = $lastCode ? (int) substr($lastCode->kode_transaksi, -4) + 1 : 1;
            $kodeTransaksi = 'BK-' . now()->format('Ymd') . '-' . str_pad($nextNum, 4, '0', STR_PAD_LEFT);

            BarangKeluar::create([
                'kode_transaksi' => $kodeTransaksi,
                'barang_id' => $request->barang_id,
                'user_id' => auth()->id(),
                'jumlah' => $request->jumlah,
                'tanggal' => $request->tanggal,
                'keterangan' => $request->keterangan,
            ]);
        });

        return redirect()->route('barang-keluar.index')->with('success', 'Barang keluar berhasil dicatat.');
    }

    public function show(BarangKeluar $barangKeluar)
    {
        $barangKeluar->load(['barang', 'user']);
        return view('barang-keluar.show', compact('barangKeluar'));
    }
}
