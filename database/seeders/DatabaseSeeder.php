<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            KategoriBarangSeeder::class,
            SatuanSeeder::class,
            SupplierSeeder::class,
            BarangSeeder::class,
            BarangMasukSeeder::class,   // harus setelah Barang & User (increment stok)
            BarangKeluarSeeder::class,  // harus setelah BarangMasuk (decrement stok, validasi stok cukup)
        ]);
    }
}
