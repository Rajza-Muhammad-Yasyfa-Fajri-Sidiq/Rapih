<?php

namespace App\Observers;

use App\Models\BarangMasuk;

class BarangMasukObserver
{
    /**
     * Setiap create barang_masuk → barang.stok += jumlah
     */
    public function created(BarangMasuk $barangMasuk): void
    {
        $barangMasuk->barang->increment('stok', $barangMasuk->jumlah);
    }
}
