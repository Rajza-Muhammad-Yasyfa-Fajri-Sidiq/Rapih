<?php

namespace App\Observers;

use App\Models\BarangKeluar;

class BarangKeluarObserver
{
    /**
     * Setiap create barang_keluar → barang.stok -= jumlah
     */
    public function created(BarangKeluar $barangKeluar): void
    {
        $barangKeluar->barang->decrement('stok', $barangKeluar->jumlah);
    }
}
