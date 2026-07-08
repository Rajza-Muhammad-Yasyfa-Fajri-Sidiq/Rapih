<?php

namespace Database\Seeders;

use App\Models\KategoriBarang;
use Illuminate\Database\Seeder;

class KategoriBarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $kategoris = [
            ['nama_kategori' => 'Alat Tulis Kantor', 'keterangan' => 'Perlengkapan tulis menulis untuk kantor'],
            ['nama_kategori' => 'Perlengkapan Cetak', 'keterangan' => 'Tinta, kertas, dan perlengkapan printer'],
            ['nama_kategori' => 'Perlengkapan Filing', 'keterangan' => 'Map, amplop, dan perlengkapan arsip'],
            ['nama_kategori' => 'Peralatan Kantor', 'keterangan' => 'Stapler, gunting, dan peralatan kantor lainnya'],
            ['nama_kategori' => 'Perlengkapan Komputer', 'keterangan' => 'Aksesoris dan perlengkapan komputer'],
        ];

        foreach ($kategoris as $kategori) {
            KategoriBarang::create($kategori);
        }
    }
}
