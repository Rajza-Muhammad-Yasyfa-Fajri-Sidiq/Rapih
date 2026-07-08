<?php

namespace App\Http\Controllers;

use App\Exports\BarangExport;
use App\Models\Barang;
use Barryvdh\DomPDF\Facade\Pdf;
use Maatwebsite\Excel\Facades\Excel;

class LaporanController extends Controller
{
    public function index()
    {
        return view('laporan.index');
    }

    public function exportExcel()
    {
        return Excel::download(new BarangExport, 'laporan-stok-barang.xlsx');
    }

    public function exportPdf()
    {
        $barangs = Barang::with(['kategori', 'satuan'])->get();
        $pdf = Pdf::loadView('laporan.pdf', compact('barangs'));
        return $pdf->download('laporan-stok-barang.pdf');
    }
}
