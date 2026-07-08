<?php

namespace Database\Seeders;

use App\Models\Barang;
use App\Models\BarangMasuk;
use App\Models\Supplier;
use App\Models\User;
use Illuminate\Database\Seeder;

class BarangMasukSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $barangIds = Barang::pluck('id')->toArray();
        $supplierIds = Supplier::pluck('id')->toArray();
        $userIds = User::pluck('id')->toArray();

        for ($i = 1; $i <= 15; $i++) {
            $barangId = fake()->randomElement($barangIds);
            $barang = Barang::find($barangId);
            $jumlah = fake()->numberBetween(10, 100);

            $masuk = BarangMasuk::create([
                'kode_transaksi' => 'BM-' . now()->format('Ymd') . '-' . str_pad($i, 4, '0', STR_PAD_LEFT),
                'barang_id' => $barangId,
                'supplier_id' => fake()->randomElement($supplierIds),
                'user_id' => fake()->randomElement($userIds),
                'jumlah' => $jumlah,
                'harga_beli' => $barang->harga_beli,
                'tanggal' => fake()->dateTimeBetween('-6 months', 'now')->format('Y-m-d'),
                'keterangan' => fake()->optional(0.5)->sentence(),
            ]);

            // Update stok barang (konsisten dengan transaksi)
            $barang->increment('stok', $jumlah);
        }
    }
}
