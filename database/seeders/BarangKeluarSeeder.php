<?php

namespace Database\Seeders;

use App\Models\Barang;
use App\Models\BarangKeluar;
use App\Models\User;
use Illuminate\Database\Seeder;

class BarangKeluarSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $userIds = User::pluck('id')->toArray();

        // Hanya ambil barang yang punya stok > 0
        $barangWithStok = Barang::where('stok', '>', 0)->get();

        $count = 0;
        $maxAttempts = 50;
        $attempts = 0;

        while ($count < 15 && $attempts < $maxAttempts) {
            $attempts++;

            // Refresh data barang yang punya stok
            $barang = Barang::where('stok', '>', 0)->inRandomOrder()->first();

            if (!$barang) {
                break; // Tidak ada barang dengan stok > 0
            }

            // Pastikan jumlah keluar tidak melebihi stok yang ada
            $maxKeluar = min($barang->stok, 20);
            if ($maxKeluar < 1) {
                continue;
            }

            $jumlah = fake()->numberBetween(1, $maxKeluar);
            $count++;

            BarangKeluar::create([
                'kode_transaksi' => 'BK-' . now()->format('Ymd') . '-' . str_pad($count, 4, '0', STR_PAD_LEFT),
                'barang_id' => $barang->id,
                'user_id' => fake()->randomElement($userIds),
                'jumlah' => $jumlah,
                'tanggal' => fake()->dateTimeBetween('-6 months', 'now')->format('Y-m-d'),
                'keterangan' => fake()->optional(0.5)->sentence(),
            ]);

            // Update stok barang (konsisten dengan transaksi)
            $barang->decrement('stok', $jumlah);
        }
    }
}
