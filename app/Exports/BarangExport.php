<?php

namespace App\Exports;

use App\Models\Barang;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class BarangExport implements FromCollection, WithHeadings, WithMapping
{
    public function collection(): \Illuminate\Support\Collection
    {
        return Barang::with(['kategori', 'satuan'])->get();
    }

    public function headings(): array
    {
        return [
            'Kode Barang', 'Nama Barang', 'Kategori', 'Satuan',
            'Stok', 'Harga Beli', 'Harga Jual', 'Stok Minimum',
        ];
    }

    public function map($barang): array
    {
        return [
            $barang->kode_barang,
            $barang->nama_barang,
            $barang->kategori->nama_kategori ?? '-',
            $barang->satuan->nama_satuan ?? '-',
            $barang->stok,
            $barang->harga_beli,
            $barang->harga_jual,
            $barang->stok_minimum,
        ];
    }
}
